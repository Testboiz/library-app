import 'package:flutter/material.dart';
import 'package:library_app/pages/home.dart';
import 'package:library_app/db-handler/mysql_handler.dart';
import 'package:mysql1/mysql1.dart';


void main() async {
  MySqlConnection conn = await MySQLHandler.mySQLOpenDB();
  var memberResult = await conn.query("SELECT * FROM member");
  print(memberResult.toList()[0]["id_member"]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
