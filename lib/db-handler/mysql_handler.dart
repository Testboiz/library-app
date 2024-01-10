import 'package:mysql1/mysql1.dart';

class MySQLHandler {
  static Future<MySqlConnection> mySQLOpenDB() async {
    final settings = ConnectionSettings(
        host: '10.0.2.2', port: 3306, user: 'root', db: 'lib_app_db');

    return await MySqlConnection.connect(settings);
  }

  static void closeMySQLDB(MySqlConnection conn) async {
    return conn.close();
  }
}
