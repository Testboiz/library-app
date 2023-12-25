import 'package:flutter/material.dart';
import 'package:library_app/db-handler/sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'book_card.dart';
import 'book_of_the_week_card.dart';


class DatabaseWidgetGenerator {
  static Future<List<BookOfTheWeekCard>> _generateBookOfTheWeekCardFromDB() async {
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

  static Future<List<BookCard>> _generateBookCardFromDB() async {
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
          }
        else{
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: bookOfTheWeekCard.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookOfTheWeekCard(
                          parent: "home",
                          judul: bookOfTheWeekCard[index].judul,
                          sinopsis: bookOfTheWeekCard[index].sinopsis,
                          imagePath: bookOfTheWeekCard[index].imagePath,
                        ),
                      ));
                },
                child: bookOfTheWeekCard[index],
              );
            },
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
          }
        else{
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