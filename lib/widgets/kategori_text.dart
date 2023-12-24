import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';

class KategoriText extends StatefulWidget {
  const KategoriText({super.key});

  @override
  State<KategoriText> createState() => _KategoriTextState();
}

class _KategoriTextState extends State<KategoriText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(8.0, 2, 8, 2),
        child: Text(
          'Genre',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
            fontFamily: "Readex",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
