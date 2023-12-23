import 'dart:io';

import 'package:flutter/material.dart';


class BookOfTheWeek extends StatelessWidget{
  const BookOfTheWeek({super.key, required this.judul, this.imagePath});
  final String judul;
  final String? imagePath;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
          0, 12, 8, 12),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          color: const Color(0xFF342743),
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x2F1D2429),
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // book image (but on the week)
                child: Image.asset(
                  imagePath?? "assests/Icons/logo.png",
                  width: double.infinity,
                  height: 114,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0, 8, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // book name
                    Text(
                      judul,
                      style: const TextStyle(
                        color: Color.fromARGB(
                            255, 111, 111, 111),
                        fontSize: 12,
                        fontFamily: "Readex",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}