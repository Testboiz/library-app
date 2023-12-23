import 'package:flutter/material.dart';
import 'package:library_app/model/admin.dart';
import 'package:library_app/pages/admin_home.dart';
import 'package:library_app/pages/detail.dart';
import 'package:library_app/pages/home.dart';
import 'package:library_app/pages/login.dart';
import 'package:library_app/pages/member_home.dart';

void main() {
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
