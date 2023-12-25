import 'package:library_app/db-handler/sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'book_card.dart';
import 'book_of_the_week_card.dart';


class DatabaseWidgetGenerator {
  static Future<List<BookOfTheWeekCard>> generateBookOfTheWeekCardFromDB() async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery(
        'SELECT * FROM buku LIMIT 2');

    return List.generate(
      dataList.length,
      (index) => BookOfTheWeekCard(
        parent: "home",
        judul: dataList[index]["judul"] as String,
        sinopsis:dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
      ),
    );
  }

  static Future<List<BookCard>> generateBookCardFromDB() async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery(
        'SELECT * FROM buku');

    return List.generate(
      dataList.length,
      (index) => BookCard(
        parent: "home",
        judul: dataList[index]["judul"] as String,
        sinopsis:dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
      ),
    );
  }
}