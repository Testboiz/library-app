import 'package:flutter/material.dart';
import 'package:library_app/db-handler/sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'book_card.dart';
import 'book_of_the_week_card.dart';

class DatabaseWidgetGenerator {
  static Future<List<BookOfTheWeekCard>> _generateBookOfTheWeekCardFromDB(
      String parent) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery('SELECT * FROM buku');

    return List.generate(
      dataList.length,
      (index) => BookOfTheWeekCard(
        parent: parent,
        judul: dataList[index]["judul"] as String,
        sinopsis: dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
      ),
    );
  }

  static Future<List<BookCard>> _generateBookCardFromDB(String parent) async {
    Database db = await SqliteHandler().myOpenDatabase();
    final dataList = await db.rawQuery('SELECT * FROM buku');

    return List.generate(
      dataList.length,
      (index) => BookCard(
        parent: parent,
        judul: dataList[index]["judul"] as String,
        sinopsis: dataList[index]["sinopsis"] as String,
        imagePath: dataList[index]["foto_sampul"] as String?,
      ),
    );
  }

  static FutureBuilder<List<BookOfTheWeekCard>> makeBookOfTheWeekCards(
      String parent) {
    return FutureBuilder(
      future: DatabaseWidgetGenerator._generateBookOfTheWeekCardFromDB(parent),
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
            );
          } else {
            return Container(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: bookOfTheWeekCard.length,
                itemBuilder: (context, index) {
                  print("Parent :  $parent");
                  return bookOfTheWeekCard[index];
                },
              ),
            );
          }
        }
      },
    );
  }

  static FutureBuilder<List<BookCard>> makeBookCards(String parent) {
    return FutureBuilder(
      future: DatabaseWidgetGenerator._generateBookCardFromDB(parent),
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
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.63,
              ),
              itemCount: bookCard.length,
              itemBuilder: (context, index) {
                return bookCard[
                    index]; // Or any other widget you want to display
              },
            );
          }
        }
      },
    );
  }
}
