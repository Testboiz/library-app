import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_app/db-handler/sqlite_handler.dart';
import 'package:library_app/item-generators/admin_member_card.dart';
import 'package:library_app/item-generators/borrowed_book_card.dart';
import 'package:library_app/model/member.dart';
import 'package:library_app/widgets/kategori.dart';
import 'package:sqflite/sqflite.dart';
import 'book_card.dart';
import 'book_of_the_week_card.dart';
import 'package:library_app/constants/membertype.dart';

class DatabaseWidgetGenerator {
  static void _doNothing(){}
  static Future<String> _generateReadMeId() async {
    Database db = await SqliteHandler().myOpenDatabase();
    final memberKeyTable =
        await db.rawQuery("SELECT MAX(ROWID) AS id FROM member");
    int rowid = memberKeyTable[0]["id"] as int;
    int rowidOffset = rowid + 3100;
    String memberKey = "Readme-${rowidOffset.toString().padLeft(4, '0')}";
    return memberKey;
  }

  static Future<Map> login(String username, String password) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery(
        "SELECT username,password,id_member,id_admin FROM user_account WHERE username=? AND password=?",
        [username, password]);
    if (dataList.isEmpty) {
      return {
        "memberType": MemberType.unregistered,
      };
    } else if (dataList[0]["id_admin"] == null) {
      final String memberKey = dataList[0]["id_member"] as String;
      final memberData = await db.rawQuery(
          "SELECT * FROM member LEFT JOIN tingkat ON member.id_tingkat = tingkat.id_tingkat WHERE member.id_member = ?",
          [memberKey]);
      return {
        // the first only
        "memberType": MemberType.user,
        "id": memberData[0]["id_member"] as String,
        "name": memberData[0]["nama_member"] as String,
        "tingkat": memberData[0]["nama_tingkat"] as String,
        "sisa_pinjam": memberData[0]["sisa_kuota"] as int,
        "tgl_balik": memberData[0]["tgl_balik"] as String?,
      };
    } else {
      return {
        "memberType": MemberType.admin,
      };
    }
  }

  static Future<bool> isMemberUnique(String name) async {
    Database db = await SqliteHandler().myOpenDatabase();
    List<Map<String, dynamic>> nameList = [];
    nameList =
        await db.query("user_account", where: "username=?", whereArgs: [name]);
    return nameList.isEmpty;
  }

  static void register(
      {String name = "", String? email, String password = ""}) async {
    Database db = await SqliteHandler().myOpenDatabase();
    String readmeId = await DatabaseWidgetGenerator._generateReadMeId();
    await db.insert("member", {
      "id_member": readmeId,
      "nama_member": name,
      "id_tingkat": 0,
      "sisa_kuota": 3,
      "buku_yang_sudah_dipinjam": 0,
    });
    await db.insert("user_account",
        {"username": name, "password": password, "id_member": readmeId});
  }

  static void changeMemberInfo(
      String idMember, String username, String password) async {
    Database db = await SqliteHandler().myOpenDatabase();
    if (username.isEmpty && password.isEmpty) {
      return;
    }
    if (username.isEmpty) {
      await db.update("user_account", {"password": password},
          where: 'id_member = ?', whereArgs: [idMember]);
      return;
    }
    if (password.isEmpty) {
      await db.update("user_account", {"username": username},
          where: 'id_member = ?', whereArgs: [idMember]);
      await db.update(
          "member",
          {
            "nama_member": username,
          },
          where: "id_member = ?",
          whereArgs: [idMember]);
      return;
    }
    await db.update(
        "user_account", {"username": username, "password": password},
        where: 'id_member = ?', whereArgs: [idMember]);
    await db.update(
        "member",
        {
          "nama_member": username,
        },
        where: "id_member = ?",
        whereArgs: [idMember]);
    return;
  }

  static Future<List<String>> findGenresById(int idBuku) async {
    Database db = await SqliteHandler().myOpenDatabase();
    String sql = """
SELECT genre.nama_genre FROM genre
LEFT JOIN genre_buku ON genre.id_genre = genre_buku.id_genre
LEFT JOIN buku ON genre_buku.id_buku = buku.id_buku  
WHERE buku.id_buku= ?
  """;
    final dataList = await db.rawQuery(sql, [idBuku]);
    return List.generate(
        dataList.length, (index) => dataList[index]["nama_genre"] as String);
  }

  // tinggal di implement
  static Future<List<AdminMemberCard>> _generateAdminMemberCardsFromDB(VoidCallback callback) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery("""
SELECT * FROM member
LEFT JOIN tingkat ON member.id_tingkat = tingkat.id_tingkat
LEFT JOIN user_account ON member.id_member = user_account.id_member;""");
    return List.generate(
        dataList.length,
        (index) => AdminMemberCard(
            nama: dataList[index]["username"] as String,
            pass: dataList[index]["password"] as String,
            memberId: dataList[index]["id_member"] as String,
            tingkat: dataList[index]["nama_tingkat"] as String,
            callback: callback,
            ));
  }

  static Future<List<BookOfTheWeekCard>> _generateBookOfTheWeekCardFromDB(
      String parent,
      {String? idMember, VoidCallback? callback}) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery('SELECT * FROM buku');
    List<List<String>> genreLists = [];
    for (int i = 0; i < dataList.length; i++) {
      genreLists.add(await findGenresById(dataList[i]["id_buku"] as int));
    }

    return List.generate(
      dataList.length,
      (index) => BookOfTheWeekCard(
        parent: parent,
        judul: dataList[index]["judul"] as String,
        sinopsis: dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
        idBuku: dataList[index]["id_buku"] as int,
        idMember: idMember,
        genre: genreLists[index],
        callback: callback ?? _doNothing,
      ),
    );
  }
  static Future<int> getSisaPinjamByMember(String memberId) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.query("member", where: "id_member = ?", whereArgs: [memberId]);
    return dataList[0]["sisa_kuota"] as int;
  }

  static Future<List<BookCard>> _generateBookCardFromDB(String parent,
      {String? genre, String? idMember, VoidCallback? callback}) async {
    Database db = await SqliteHandler().myOpenDatabase();
    List<Map> dataList = [{}];
    if (genre != null) {
      String sql = """SELECT * FROM buku 
LEFT JOIN genre_buku ON buku.id_buku = genre_buku.id_buku
LEFT JOIN genre ON genre_buku.id_genre = genre.id_genre
WHERE genre.nama_genre = ?;""";
      dataList = await db.rawQuery(sql, [genre]);
    } else {
      dataList = await db.rawQuery('SELECT * FROM buku');
    }
    List<List<String>> genreLists = [];
    for (int i = 0; i < dataList.length; i++) {
      genreLists.add(await findGenresById(dataList[i]["id_buku"]));
    }
    return List.generate(
      dataList.length,
      (index) => BookCard(
        parent: parent,
        judul: dataList[index]["judul"] as String,
        sinopsis: dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
        idBuku: dataList[index]["id_buku"] as int,
        idMember: idMember,
        genre: genreLists[index],
        callback: callback?? _doNothing,
      ),
    );
  }
  static Future<List<BorrowedBookCard>> _generateBorrowedBookCard(String idMember, VoidCallback? callback) async{
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery("""SELECT * FROM peminjaman
LEFT JOIN detail_pinjaman ON peminjaman.id_peminjam = detail_pinjaman.id_peminjaman
LEFT JOIN buku ON detail_pinjaman.id_buku = buku.id_buku
WHERE peminjaman.id_member = ?;""", [idMember]);
    return List.generate(dataList.length,
    (index) => BorrowedBookCard(imagePath: dataList[index]["foto_sampul"] as String,
    judul: dataList[index]["judul"] as String, 
    tglDeadline: dataList[index]["tgl_kadarluasa"] as String, 
    idPeminjaman: dataList[index]["id_peminjaman"] as int, 
    idMember: idMember, 
    idBuku: dataList[index]["id_buku"] as int,
    callback: callback ?? _doNothing,
    ));
  }
  static Future<List<Category>> _generateCategoryButtons(String parent, {Member? memberInfo}) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.query("genre");
    List<Category> initList= [Category(parent: parent,memberInfo: memberInfo,)];
    List<Category> toAppend= List<Category>.generate(dataList.length, 
    (index) => Category(genre: dataList[index]["nama_genre"] as String,parent: parent, memberInfo: memberInfo,));
    initList.addAll(toAppend);
    return initList;
  }

  static FutureBuilder<List<AdminMemberCard>> makeAdminMemberCards(VoidCallback callback) {
    return FutureBuilder(
        future: DatabaseWidgetGenerator._generateAdminMemberCardsFromDB(callback),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<AdminMemberCard> adminMemberCard = snapshot.data ?? [];
            if (adminMemberCard.isEmpty) {
              return const AdminMemberCard(
                  nama: "placeholder", pass: "place_holder", memberId: "",callback: _doNothing,);
            } else {
              return SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: adminMemberCard.length,
                  itemBuilder: (context, index) {
                    return adminMemberCard[index];
                  },
                ),
              );
            }
          }
        }));
  }

  static FutureBuilder<List<BookOfTheWeekCard>> makeBookOfTheWeekCards(
      String parent,
      {String? idMember, VoidCallback? callback}) {
    return FutureBuilder(
      future: DatabaseWidgetGenerator._generateBookOfTheWeekCardFromDB(parent,
          idMember: idMember, callback: callback),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<BookOfTheWeekCard> bookOfTheWeekCard = snapshot.data ?? [];
          if (bookOfTheWeekCard.isEmpty) {
            return BookOfTheWeekCard(
              parent: parent,
              judul: "Judul Buku",
              sinopsis: "sinopsis",
              genre: const ["Genre"],
            );
          } else {
            return SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: bookOfTheWeekCard.length,
                itemBuilder: (context, index) {
                  return bookOfTheWeekCard[index];
                },
              ),
            );
          }
        }
      },
    );
  }

  static FutureBuilder<List<BookCard>> makeBookCards(String parent,
      {String? genre, String? idMember, VoidCallback? callback}) {
    return FutureBuilder(
      future: DatabaseWidgetGenerator._generateBookCardFromDB(parent,
          genre: genre, idMember: idMember, callback: callback),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<BookCard> bookCard = snapshot.data ?? [];
          return GridView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.63,
            ),
            itemCount: bookCard.length,
            itemBuilder: (context, index) {
              return bookCard[index]; // Or any other widget you want to display
            },
          );
        }
      },
    );
  }

  static FutureBuilder<List<Widget>> makeBorrowedBookCards(String idMember, VoidCallback? callback) {
    return FutureBuilder(
        future: DatabaseWidgetGenerator._generateBorrowedBookCard(idMember, callback),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Widget> borrowedBookCard = snapshot.data ?? [];
            if (borrowedBookCard.isEmpty) {
              return const Text("Anda Belum Meminjam");
            } else {
              return 
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    itemCount: borrowedBookCard.length,
                    itemBuilder: (context, index) {
                      return borrowedBookCard[index];
                    },
                  ),
                );
            }
          }
        }));
  }
  
  static FutureBuilder<List<Category>> makeCategoryButtons(String parent, {Member? memberInfo}) {
  return FutureBuilder(
    future: DatabaseWidgetGenerator._generateCategoryButtons(parent, memberInfo: memberInfo),
    builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        List<Category> categoryButtons = snapshot.data ?? [];
        if (categoryButtons.isEmpty) {
          return const Category();
        } else {
          return SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categoryButtons.length,
              itemBuilder: (context, index) {
                return categoryButtons[index];
              },
            ),
          );
        }
      }
    }),
  );
}

static Future<List<Map>> toGenreMap({int? idBuku}) async
{
  Database db = await SqliteHandler().myOpenDatabase();
  if (idBuku != null){
    final dataList = await db.query("genre");
    final bookGenres = await db.query(
      "genre_buku", 
      where: "id_buku = ?", 
      whereArgs: [idBuku], 
      orderBy: "id_genre");
    List<int> genreIds = 
      List.generate(bookGenres.length, 
        (index) => bookGenres[index]["id_buku"] as int);
      
    // status true => merupakan genre dari buku itu
    return List.generate(dataList.length,
    (index) =>{
      'genre':dataList[index]["nama_genre"],
      'status':(genreIds.contains(dataList[index]["id_genre"] as int)),
      'id_genre':dataList[index]["id_genre"]
    });
  }
  else{
    final dataList = await db.query("genre");
    return List.generate(dataList.length, 
    (index) => {
      'genre':dataList[index]["nama_genre"],
      'status':false,
      'id_genre':dataList[index]["id_genre"]
    });
  }
  
}
/// Membandingkan daftar genre pertama dan kedua. Fungsi ini digunakan
/// untuk menentukan genre yang akan dihapus dari db dan juga genre
/// yang akan diupdate
static List<Map> _compareGenreMap(List<Map> first, List<Map> second, {bool removeMode = false}){
  List<Map> result = [];
  for (int i = 0; i < first.length; i++){
    if (removeMode == true){
      if (first[i]['status'] == true && second[i]['status'] == false){
        result.add(first[i]);
      }
    }
    else{
      if (first[i]['status'] == false && second[i]['status'] == true){
        result.add(first[i]);
      }
    }
  }
  return result;
}


  static void pinjamBuku(String? idMember, int? idBuku) async {
    Database db = await SqliteHandler().myOpenDatabase();
    DateFormat sqlDateFormat = DateFormat("yyyy-MM-dd");
    DateTime today = DateTime.now();
    String todayDateString = sqlDateFormat.format(today);

    if (idMember == null || idBuku == null) {
      // early exit to  prevent some accidental queries
      return;
    }
    // sisa pinjam harus dikurangi
    await db.rawQuery(
        "UPDATE member SET sisa_kuota = sisa_kuota - 1 WHERE id_member = ?",
        [idMember]);
    // insert ke tabel peminjaman dengan subquery
    final tabelLamaPinjam =
        await db.rawQuery("""SELECT lama_pinjam FROM tingkat WHERE id_tingkat = 
(SELECT id_tingkat FROM member WHERE id_member = ?);""", [idMember]);
    final int lamaPinjam = tabelLamaPinjam[0]["lama_pinjam"] as int;
    DateTime deadlineDateTime = today.add(Duration(days: lamaPinjam));
    String deadline = sqlDateFormat.format(deadlineDateTime);

    await db.insert("peminjaman", {
      "id_member": idMember,
      "tgl_peminjaman": todayDateString,
      "tgl_kadarluasa": deadline
    });
    // insert detail peminjaman
    final idPeminjamanTerakhirTable =
        await db.rawQuery("SELECT MAX(id_peminjam) AS id FROM peminjaman");
    int idPinjam = idPeminjamanTerakhirTable[0]["id"] as int;
    await db.insert(
        "detail_pinjaman", {"id_peminjaman": idPinjam, "id_buku": idBuku});
  }

  static Future<void> kembalikanBuku(
      int idPeminjaman, int idBuku, String idMember) async {
    Database db = await SqliteHandler().myOpenDatabase();
    // delete peminjaman
    await db.delete("peminjaman",
        where: "id_peminjam = ?", whereArgs: [idPeminjaman]);
    // delete detail peminjaman tidak perlu karena CASCADE
    // increment ulang buku
    await db.rawQuery(
        "UPDATE member SET sisa_kuota = sisa_kuota + 1 WHERE id_member = ?",
        [idMember]);
  }

  static Future<void> kembalikanSemuaBuku(String idMember) async {
    Database db = await SqliteHandler().myOpenDatabase();
    int deletedAmnount = await db
        .delete("peminjaman", where: "id_member = ?", whereArgs: [idMember]);
    await db.rawQuery(
        "UPDATE member SET sisa_kuota = sisa_kuota + ? WHERE id_member = ?",
        [deletedAmnount, idMember]);
  }

  static void addMember(String nama, int tingkat, String? imagePath) async {
    Database db = await SqliteHandler().myOpenDatabase();
    await db.insert("member", {
      "id_member": DatabaseWidgetGenerator._generateReadMeId(),
      "nama_member": nama,
      "id_tingkat": tingkat,
      "sisa_kuota": -1, // need helper function
      "buku_yang_sudah_dipinjam": 0,
      "foto": imagePath
    });
  }

  static void editMember(
      String idMember,
      String? namaBaru,
      int? idTingkatBaru,
      int? sisaKuotaBaru,
      String? linkGambarBaru,
      String? jumlahBukuYangSudahDipinjamBaru) async {
    Database db = await SqliteHandler().myOpenDatabase();
    Map<String, dynamic> sqlMapArgs = {
      "nama_member": namaBaru,
      "id_tingkat": idTingkatBaru,
      "sisa_kuota": sisaKuotaBaru,
      "foto": linkGambarBaru,
      "buku_yang_sudah_dipinjam": jumlahBukuYangSudahDipinjamBaru
    };
    // memfilter jika null
    sqlMapArgs.removeWhere((key, value) => value == null);

    await db.update("member", sqlMapArgs);
  }

  static void deleteMember(String idMember) async {
    Database db = await SqliteHandler().myOpenDatabase();
    await db.delete("member", where: "id_member = ?", whereArgs: [idMember]);
  }

  static void addBuku
  (String judul, 
  String? sinopsis, 
  String? fotoSampul, 
  List<Map> genreMap)
  async {
    Database db = await SqliteHandler().myOpenDatabase();
    // fase insert buku
    await db.insert("buku", {
      "judul":judul,
      "sinopsis":sinopsis,
      "foto_sampul":fotoSampul
    });
    // mendapatkan pk buku
    final maxIdBukuTable = await db.rawQuery("SELECT MAX(id_buku) AS id FROM buku");
    int idBuku = maxIdBukuTable[0]["id"] as int;
    // fase insert genre buku
    for (Map m in genreMap){
      if (m["status"]== true){
        db.insert("genre_buku", {
        "id_buku":idBuku,
        "id_genre":m["id_genre"]
      });
      }
    }
  }

  static void editBuku(
    int idBuku,
    String judul,
    String? sinopsis, 
    String? fotoSampul, 
    List<Map<String,dynamic>> genreMap) 
    async {
    Database db = await SqliteHandler().myOpenDatabase();
    // fase update buku
    await db.update("buku", {
      "judul":judul,
      "sinopsis":sinopsis,
      "foto_sampul":fotoSampul
    }, where: "id_buku = ?",
    whereArgs: [idBuku]);
    // fase update genre buku (lain dikit)
    List<Map> toDelete = _compareGenreMap(genreMap, await toGenreMap(idBuku: idBuku), removeMode: true);
    List<Map> toAdd = _compareGenreMap(genreMap, await toGenreMap(idBuku: idBuku));

    for (Map m in toDelete){
      await db.delete("genre_buku", 
        where: "id_buku = ? AND id_genre = ?",
        whereArgs: [idBuku,m["id_genre"]]
      );
    }
    for (Map m in toAdd){
      await db.insert("genre_buku", {
        "id_buku":idBuku,
        "id_genre":m["id_genre"]
      });
    }    
  }

  static Future<void> deleteBuku(int idBuku) async {
    Database db = await SqliteHandler().myOpenDatabase();
    await db.delete("buku", where: "id_buku = ?", whereArgs: [idBuku]);
  }
  static Future<void> addGenre(String namaGenre) async {
    Database db = await SqliteHandler().myOpenDatabase();
    await db.insert("genre", {
      "nama_genre":namaGenre
    });
  }
}
