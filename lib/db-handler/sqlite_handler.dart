import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class SqliteHandler {
  Future<Database> myOpenDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database_bunga.sqlite");

    if (!await databaseExists(path)) {
      ByteData data =
          await rootBundle.load(join("assets", "database_bunga.sqlite"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path);
  }
}
