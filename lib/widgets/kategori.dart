import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/pages/home.dart';

class Category extends StatefulWidget {
  const Category({super.key, this.genre});
  final String? genre;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 35,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(selectedGenre: widget.genre,)));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  ),
                  backgroundColor: MaterialStateProperty.all(categoryColor),
                  elevation: MaterialStateProperty.all(3),
                  shape: MaterialStateProperty.all(
                    ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  widget.genre ?? "All",
                  style: titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
