import 'package:mysql1/mysql1.dart';

class MySQLHandler {
  static Future<MySqlConnection> mySQLOpenDB() async {
    final settings = ConnectionSettings(
        // host: '192.168.1.65',
        host: "localhost",
        port: 3306,
        user: 'root',
        db: 'lib_app_db');

    return await MySqlConnection.connect(settings);
  }

  static void closeMySQLDB(MySqlConnection conn) async {
    return conn.close();
  }
}
