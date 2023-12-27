import 'package:flutter/material.dart';
import 'package:library_app/db-handler/sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'book_card.dart';
import 'book_of_the_week_card.dart';
import 'package:library_app/constants/membertype.dart';
import 'package:library_app/pages/member_home.dart';

class DatabaseWidgetGenerator {
  static Future<Map> login(String username, String password) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery("SELECT username,password,id_member,id_admin FROM user_account WHERE username=? AND password=?",[username,password]);
    if (dataList.isEmpty){
      return {
        "memberType" : MemberType.unregistered,
      };
    }
    else if (dataList[0]["id_admin"] == null){
      final int memberKey = dataList[0]["id_member"] as int;
      final memberData = await db.rawQuery("SELECT * FROM member LEFT JOIN tingkat ON member.id_tingkat = tingkat.id_tingkat WHERE member.id_member = ?",[memberKey]);
      return{
        // the first only
        "memberType":MemberType.user,
        "id":memberData[0]["id_member"] as String,
        "name":memberData[0]["nama_member"] as String,
        "tingkat":memberData[0]["nama_tingkat"] as String,
        "sisa_pinjam":memberData[0]["sisa_kuota"] as int,
        "tgl_balik":memberData[0]["tgl_balik"] as String?,
      };
    }
    else{ 
      return {
        "memberType" : MemberType.admin,
      };
    }
  }

  static void register({
    String name = "",
    String? email,
    String password = ""}) async {
    Database db = await SqliteHandler().myOpenDatabase();
    await db.insert("member", {

      "nama_member":name,
      "id_tingkat":0,
      "sisa_kuota":3,
      "buku_yang_sudah_dipinjam":0,
    });
    print(await db.query("member"));
    final memberKeyTable = await db.rawQuery("SELECT MAX(id_member) AS id FROM member");
    print(memberKeyTable);
    final int memberKey = memberKeyTable[0]["id"] as int;
    await db.insert("user_account",{
      "username":name,
      "password":password,
      "id_member":memberKey
    });
    print(await db.query("user_account"));

  }
  
  static Future<List<BookOfTheWeekCard>>
      _generateBookOfTheWeekCardFromDB() async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery('SELECT * FROM buku');

    return List.generate(
      dataList.length,
      (index) => BookOfTheWeekCard(
        parent: "home",
        judul: dataList[index]["judul"] as String,
        sinopsis: dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
      ),
    );
  }

  static Future<List<BookCard>> _generateBookCardFromDB() async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery('SELECT * FROM buku');

    return List.generate(
      dataList.length,
      (index) => BookCard(
        parent: "home",
        judul: dataList[index]["judul"] as String,
        sinopsis: dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
      ),
    );
  }

  static FutureBuilder<List<BookOfTheWeekCard>> makeBookOfTheWeekCards() {
    return FutureBuilder(
      future: DatabaseWidgetGenerator._generateBookOfTheWeekCardFromDB(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<BookOfTheWeekCard> bookOfTheWeekCard = snapshot.data ?? [];
          if (bookOfTheWeekCard.isEmpty) {
            return const BookOfTheWeekCard(
              parent: "home",
              judul: "Judul Buku",
              sinopsis: "sinopsis",
            );
          } else {
            return SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: bookOfTheWeekCard.length,
                physics: const NeverScrollableScrollPhysics(),
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

  static FutureBuilder<List<BookCard>> makeBookCards() {
    return FutureBuilder(
      future: DatabaseWidgetGenerator._generateBookCardFromDB(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<BookCard> bookCard = snapshot.data ?? [];
          if (bookCard.isEmpty) {
            return const BookCard(
              parent: "home",
              judul: "Judul Buku",
              sinopsis: "sinopsis",
            );
          } else {
            return GridView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.83,
              ),
              itemCount: bookCard.length,
              itemBuilder: (context, index) {
                return bookCard[index]; // Or any other widget you want to display
              },
            );
          }
        }
      },
    );
  }
}
