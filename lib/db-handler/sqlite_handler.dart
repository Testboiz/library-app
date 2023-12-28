import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class SqliteHandler {
  Future<Database> myOpenDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "lib-app.db");
  // g bakal simpan update untuk sementara
    if (!await databaseExists(path)) {
      ByteData data =
          await rootBundle.load(join("db", "lib-app.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    
    return await openDatabase(path, readOnly: false);
  }
}
