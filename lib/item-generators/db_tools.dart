import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/db-handler/mysql_handler.dart';
import 'package:library_app/item-generators/admin_member_card.dart';
import 'package:library_app/item-generators/borrowed_book_card.dart';
import 'package:library_app/model/member.dart';
import 'package:library_app/widgets/kategori.dart';
import 'package:mysql1/mysql1.dart';
import 'book_card.dart';
import 'book_of_the_week_card.dart';
import 'package:library_app/constants/membertype.dart';

class MySQLDBFunctions {
  static void _doNothing() {}

  static Future<String> _generateReadMeId() async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    final memberKeyTable = await conn
        .query("SELECT RIGHT(MAX(id_member),4) + 1 AS new_id FROM member;");
    String memberKey = "Readme-${memberKeyTable.first["new_id"].toInt()}";
    return memberKey;
  }

  static Future<Map> login(String username, String password) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      var rawDataList = await conn.query(
          "SELECT username,password,id_member,id_admin FROM user_account WHERE username=? AND password=?",
          [username, password]);
      var dataList = rawDataList.toList();
      if (dataList.isEmpty) {
        return {
          "memberType": MemberType.unregistered,
        };
      } else if (dataList[0]["id_admin"] == null) {
        final String memberKey = dataList[0]["id_member"] as String;
        final rawMemberData = await conn.query(
            "SELECT * FROM member LEFT JOIN tingkat ON member.id_tingkat = tingkat.id_tingkat WHERE member.id_member = ?",
            [memberKey]);
        final memberData = rawMemberData.toList();
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
    } finally {
      conn.close();
    }
  }

  static Future<bool> isMemberUnique(String name) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      Results nameList;
      nameList = await conn
          .query("SELECT * FROM user_account WHERE username=?", [name]);
      return nameList.isEmpty;
    } finally {
      conn.close();
    }
  }

  static void register(
      {String name = "", String? email, String password = ""}) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      String readmeId = await MySQLDBFunctions._generateReadMeId();
      await conn.query(
          "INSERT INTO member (id_member,nama_member,id_tingkat,sisa_kuota,buku_yang_sudah_dipinjam) VALUES (?,?,?,?,?)",
          [readmeId, name, 1, 3, 0]);
      await conn.query(
          "INSERT INTO user_account (username,password,id_member) VALUES (?,?,?)",
          [name, password, readmeId]);
    } finally {
      conn.close();
    }
  }

  static void changeMemberInfo(
      String idMember, String username, String password) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      if (username.isEmpty && password.isEmpty) {
        return;
      }
      if (username.isEmpty) {
        await conn.query(
            "UPDATE user_account SET password = ? WHERE id_member = ?",
            [password, idMember]);
        return;
      }
      if (password.isEmpty) {
        await conn.query(
            "UPDATE user_account SET username = ? WHERE id_member = ?",
            [username, idMember]);
        await conn.query(
            "UPDATE member SET nama_member = ? WHERE id_member = ?",
            [username, idMember]);
        return;
      }
      await conn.query(
          "UPDATE user_account SET username = ?, password = ? WHERE id_member = ?",
          [username, password, idMember]);
      await conn.query("UPDATE member SET nama_member = ? WHERE id_member = ?",
          [username, idMember]);
    } finally {
      conn.close();
    }
  }

  static Future<List<String>> findGenresById(int idBuku) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      String sql = """
SELECT genre.nama_genre FROM genre
LEFT JOIN genre_buku ON genre.id_genre = genre_buku.id_genre
LEFT JOIN buku ON genre_buku.id_buku = buku.id_buku  
WHERE buku.id_buku= ?
  """;
      final rawDataList = await conn.query(sql, [idBuku]);
      final dataList = rawDataList.toList();
      return List.generate(
          dataList.length, (index) => dataList[index]["nama_genre"] as String);
    } finally {
      conn.close();
    }
  }

  static Future<List<AdminMemberCard>> _generateAdminMemberCardsFromDB(
      VoidCallback callback) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      final rawDataList = await conn.query("""
SELECT * FROM member
LEFT JOIN tingkat ON member.id_tingkat = tingkat.id_tingkat
LEFT JOIN user_account ON member.id_member = user_account.id_member;""");
      final dataList = rawDataList.toList();
      return List.generate(
          dataList.length,
          (index) => AdminMemberCard(
                nama: dataList[index]["username"] as String,
                pass: dataList[index]["password"] as String,
                memberId: dataList[index]["id_member"] as String,
                tingkat: dataList[index]["nama_tingkat"] as String,
                callback: callback,
              ));
    } finally {
      conn.close();
    }
  }

  static Future<List<BookOfTheWeekCard>> _generateBookOfTheWeekCardFromDB(
      String parent,
      {String? idMember,
      VoidCallback? callback}) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      final rawDataList = await conn.query('SELECT * FROM buku');
      final dataList = rawDataList.toList();
      List<List<String>> genreLists = [];
      for (int i = 0; i < dataList.length; i++) {
        genreLists.add(await findGenresById(dataList[i]["id_buku"] as int));
      }
      // TEXT di MySQL dianggap BLOB di flutter
      return List.generate(
        dataList.length,
        (index) => BookOfTheWeekCard(
          parent: parent,
          judul: dataList[index]["judul"],
          sinopsis: dataList[index]["sinopsis"].toString(),
          imagePath: dataList[index]["foto_sampul"] as String?,
          idBuku: dataList[index]["id_buku"] as int,
          idMember: idMember,
          genre: genreLists[index],
          callback: callback ?? _doNothing,
        ),
      );
    } finally {
      conn.close();
    }
  }

  static Future<int> getSisaPinjamByMember(String memberId) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      final dataList = await conn
          .query("SELECT * FROM member WHERE id_member = ?", [memberId]);
      return dataList.first["sisa_kuota"] as int;
    } finally {
      conn.close();
    }
  }

  static Future<List<BookCard>> _generateBookCardFromDB(String parent,
      {String? genre, String? idMember, VoidCallback? callback}) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      List<ResultRow> dataList = [];
      Results rawDataList;
      if (genre != null) {
        String sql = """SELECT * FROM buku 
LEFT JOIN genre_buku ON buku.id_buku = genre_buku.id_buku
LEFT JOIN genre ON genre_buku.id_genre = genre.id_genre
WHERE genre.nama_genre = ?;""";
        rawDataList = await conn.query(sql, [genre]);
      } else {
        rawDataList = await conn.query('SELECT * FROM buku');
      }
      dataList = rawDataList.toList();
      List<List<String>> genreLists = [];
      for (int i = 0; i < dataList.length; i++) {
        genreLists.add(await findGenresById(dataList[i]["id_buku"]));
      }
      // TEXT di MySQL dianggap BLOB di flutter
      return List.generate(
        dataList.length,
        (index) => BookCard(
          parent: parent,
          judul: dataList[index]["judul"] as String,
          sinopsis: dataList[index]["sinopsis"].toString(),
          imagePath: dataList[index]["foto_sampul"] as String?,
          idBuku: dataList[index]["id_buku"] as int,
          idMember: idMember,
          genre: genreLists[index],
          callback: callback ?? _doNothing,
        ),
      );
    } finally {
      conn.close();
    }
  }

  static Future<List<BorrowedBookCard>> _generateBorrowedBookCard(
      String idMember, VoidCallback? callback) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      DateFormat sqlDateFormat = DateFormat("yyyy-MM-dd");
      final rawDataList = await conn.query("""SELECT * FROM peminjaman
LEFT JOIN detail_pinjaman ON peminjaman.id_peminjam = detail_pinjaman.id_peminjaman
LEFT JOIN buku ON detail_pinjaman.id_buku = buku.id_buku
WHERE peminjaman.id_member = ?;""", [idMember]);
      final dataList = rawDataList.toList();
      return List.generate(
          dataList.length,
          (index) => BorrowedBookCard(
                imagePath: dataList[index]["foto_sampul"] as String,
                judul: dataList[index]["judul"] as String,
                tglDeadline:
                    sqlDateFormat.format(dataList[index]["tgl_kadarluasa"]),
                idPeminjaman: dataList[index]["id_peminjaman"] as int,
                idMember: idMember,
                idBuku: dataList[index]["id_buku"] as int,
                callback: callback ?? _doNothing,
              ));
    } finally {
      conn.close();
    }
  }

  static Future<List<Category>> _generateCategoryButtons(String parent,
      {Member? memberInfo}) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      final dataList = await conn.query("SELECT * FROM genre");
      List<Category> initList = [
        Category(
          parent: parent,
          memberInfo: memberInfo,
        )
      ];
      List<Category> toAppend = List<Category>.generate(
          dataList.length,
          (index) => Category(
                genre: dataList.toList()[index]["nama_genre"] as String,
                parent: parent,
                memberInfo: memberInfo,
              ));
      initList.addAll(toAppend);
      return initList;
    } finally {
      conn.close();
    }
  }

  static FutureBuilder<List<AdminMemberCard>> makeAdminMemberCards(
      VoidCallback callback) {
    return FutureBuilder(
        future: MySQLDBFunctions._generateAdminMemberCardsFromDB(callback),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<AdminMemberCard> adminMemberCard = snapshot.data ?? [];
            if (adminMemberCard.isEmpty) {
              return const AdminMemberCard(
                nama: "placeholder",
                pass: "place_holder",
                memberId: "",
                callback: _doNothing,
              );
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
      {String? idMember,
      VoidCallback? callback}) {
    return FutureBuilder(
      future: MySQLDBFunctions._generateBookOfTheWeekCardFromDB(parent,
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
      future: MySQLDBFunctions._generateBookCardFromDB(parent,
          genre: genre, idMember: idMember, callback: callback),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: labelMedium,
          );
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

  static FutureBuilder<List<Widget>> makeBorrowedBookCards(
      String idMember, VoidCallback? callback) {
    return FutureBuilder(
        future: MySQLDBFunctions._generateBorrowedBookCard(idMember, callback),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Widget> borrowedBookCard = snapshot.data ?? [];
            if (borrowedBookCard.isEmpty) {
              return const Text(
                "Anda Belum Meminjam..",
                style: TextStyle(
                  color: Color.fromARGB(255, 136, 136, 136),
                  fontSize: 20,
                  fontFamily: "Readex",
                  fontWeight: FontWeight.w500,
                ),
              );
            } else {
              return SizedBox(
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

  static FutureBuilder<List<Category>> makeCategoryButtons(String parent,
      {Member? memberInfo}) {
    return FutureBuilder(
      future: MySQLDBFunctions._generateCategoryButtons(parent,
          memberInfo: memberInfo),
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

  static Future<List<Map>> toGenreMap({int? idBuku}) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      if (idBuku != null) {
        final rawDataList = await conn.query("SELECT * FROM genre");
        final rawBookGenres = await conn.query(
            "SELECT * FROM genre_buku WHERE id_buku = ? ORDER BY id_genre ASC");
        final dataList = rawDataList.toList();
        final bookGenres = rawBookGenres.toList();
        List<int> genreIds = List.generate(
            bookGenres.length, (index) => bookGenres[index]["id_buku"] as int);

        // status true => merupakan genre dari buku itu
        return List.generate(
            dataList.length,
            (index) => {
                  'genre': dataList[index]["nama_genre"],
                  'status':
                      (genreIds.contains(dataList[index]["id_genre"] as int)),
                  'id_genre': dataList[index]["id_genre"]
                });
      } else {
        final rawDataList = await conn.query("SELECT * FROM genre");
        final dataList = rawDataList.toList();
        return List.generate(
            dataList.length,
            (index) => {
                  'genre': dataList[index]["nama_genre"],
                  'status': false,
                  'id_genre': dataList[index]["id_genre"]
                });
      }
    } finally {
      conn.close();
    }
  }

  /// Membandingkan daftar genre pertama dan kedua. Fungsi ini digunakan
  /// untuk menentukan genre yang akan dihapus dari db dan juga genre
  /// yang akan diupdate
  static List<Map> _compareGenreMap(List<Map> first, List<Map> second,
      {bool removeMode = false}) {
    List<Map> result = [];
    for (int i = 0; i < first.length; i++) {
      if (removeMode == true) {
        if (first[i]['status'] == true && second[i]['status'] == false) {
          result.add(first[i]);
        }
      } else {
        if (first[i]['status'] == false && second[i]['status'] == true) {
          result.add(first[i]);
        }
      }
    }
    return result;
  }

  static void pinjamBuku(String? idMember, int? idBuku) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      DateFormat sqlDateFormat = DateFormat("yyyy-MM-dd");
      DateTime today = DateTime.now();
      String todayDateString = sqlDateFormat.format(today);

      if (idMember == null || idBuku == null) {
        // early exit to  prevent some accidental queries
        return;
      }
      await conn.query(
          "UPDATE member SET sisa_kuota = sisa_kuota - 1 WHERE id_member = ?",
          [idMember]);
      final tabelLamaPinjam = await conn
          .query("""SELECT lama_pinjam FROM tingkat WHERE id_tingkat = 
  (SELECT id_tingkat FROM member WHERE id_member = ?);""", [idMember]);
      final int lamaPinjam = tabelLamaPinjam.first["lama_pinjam"] as int;
      DateTime deadlineDateTime = today.add(Duration(days: lamaPinjam));
      String deadline = sqlDateFormat.format(deadlineDateTime);
      await conn.query(
          "INSERT INTO peminjaman (id_member,tgl_peminjaman,tgl_kadarluasa) VALUES (?,?,?)",
          [idMember, todayDateString, deadline]);
      // insert detail peminjaman
      final idPeminjamanTerakhirTable =
          await conn.query("SELECT MAX(id_peminjam) AS id FROM peminjaman");
      int idPinjam = idPeminjamanTerakhirTable.first["id"] as int;
      await conn.query(
          "INSERT INTO detail_pinjaman (id_peminjaman,id_buku) VALUES (?,?)",
          [idPinjam, idBuku]);
    } finally {
      conn.close();
    }
  }

  static Future<void> kembalikanBuku(
      int idPeminjaman, int idBuku, String idMember) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      // delete peminjaman
      await conn.query(
          "DELETE FROM peminjaman WHERE id_peminjam = ?", [idPeminjaman]);
      // delete detail peminjaman tidak perlu karena CASCADE
      // increment ulang buku
      await conn.query(
          "UPDATE member SET sisa_kuota = sisa_kuota + 1 WHERE id_member = ?",
          [idMember]);
    } finally {
      conn.close();
    }
  }

  static Future<void> kembalikanSemuaBuku(String idMember) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      // delete peminjaman
      final rows = await conn
          .query("DELETE FROM peminjaman WHERE id_member = ?", [idMember]);
      // delete detail peminjaman tidak perlu karena CASCADE
      // increment ulang buku
      await conn.query(
          "UPDATE member SET sisa_kuota = sisa_kuota + ? WHERE id_member = ?",
          [rows.affectedRows, idMember]);
    } finally {
      conn.close();
    }
  }

  static void addMember(String nama, int tingkat, String? imagePath) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      final tingkatInfo = await conn.query(
          "SELECT banyak_pinjam FROM tingkat WHERE id_tingkat = ?", [tingkat]);
      int totalPinjam = tingkatInfo.first["banyak_pinjam"].toInt();
      await conn.query("INSERT INTO member VALUES (?,?,?,?,?,?)", [
        MySQLDBFunctions._generateReadMeId(),
        nama,
        tingkat,
        totalPinjam,
        0,
        imagePath
      ]);
    } finally {
      conn.close();
    }
  }

  static void editMember(
      String idMember,
      String? namaBaru,
      int? idTingkatBaru,
      int? sisaKuotaBaru,
      String? linkGambarBaru,
      String? jumlahBukuYangSudahDipinjamBaru) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      await conn.query("""
                    UPDATE member SET 
                    nama_member = ?,
                    id_tingkat = ?,
                    sisa_kuota = ?.
                    foto = ?,
                    buku_yang_sudah_dipinjam = ?
                    WHERE id_member = ?
                    """, [
        namaBaru,
        idTingkatBaru,
        sisaKuotaBaru,
        linkGambarBaru,
        jumlahBukuYangSudahDipinjamBaru,
        idMember
      ]);
    } finally {
      conn.close();
    }
  }

  static void deleteMember(String idMember) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      await conn.query("DELETE FROM member WHERE id_member = ?", [idMember]);
    } finally {
      conn.close();
    }
  }

  static Future<void> addBuku(String judul, String? sinopsis,
      String? fotoSampul, List<Map> genreMap) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      // fase insert buku
      await conn.query(
          "INSERT INTO buku (judul,sinopsis,foto_sampul) VALUES (?,?,?)",
          [judul, sinopsis, fotoSampul]);
      // mendapatkan pk buku
      final maxIdBukuTable =
          await conn.query("SELECT MAX(id_buku) AS id FROM buku");
      int idBuku = maxIdBukuTable.first["id"] as int;
      // fase insert genre buku
      for (Map m in genreMap) {
        if (m["status"] == true) {
          await conn.query(
              "INSERT INTO genre_buku VALUES (?,?)", [idBuku, m["id_genre"]]);
        }
      }
    } finally {
      conn.close();
    }
  }

  static void editBuku(int idBuku, String judul, String? sinopsis,
      String? fotoSampul, List<Map<String, dynamic>> genreMap) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      await conn.query(
          "UPDATE buku SET judul=?, sinopsis=?, foto_sampul=? WHERE id_buku = ?",
          [judul, sinopsis, fotoSampul, idBuku]);
      // fase update genre buku (lain dikit)
      List<Map> toDelete = _compareGenreMap(
          genreMap, await toGenreMap(idBuku: idBuku),
          removeMode: true);
      List<Map> toAdd =
          _compareGenreMap(genreMap, await toGenreMap(idBuku: idBuku));
      for (Map m in toDelete) {
        await conn.query(
            "DELETE FROM genre_buku WHERE id_buku = ? AND id_genre = ?",
            [idBuku, m["id_genre"]]);
      }
      for (Map m in toAdd) {
        await conn.query(
            "INSERT INTO genre_buku VALUES (?,?)", [idBuku, m["id_genre"]]);
      }
    } finally {
      conn.close();
    }
  }

  static Future<void> deleteBuku(int idBuku) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      await conn.query("DELETE FROM buku WHERE id_buku = ?", [idBuku]);
    } finally {
      conn.close();
    }
  }

  static Future<void> addGenre(String namaGenre) async {
    MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
    try {
      await conn
          .query("INSERT INTO genre (nama_genre) VALUES (?)", [namaGenre]);
    } finally {
      conn.close();
    }
  }
}
