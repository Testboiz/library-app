import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';

class BookCard extends StatelessWidget{
  const BookCard({super.key, required this.judul, required this.deskripsi, this.imagePath});
  final String judul;
  final String deskripsi;
  final String? imagePath;
  
  @override
  Widget build(BuildContext context){
   return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding:
              const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 8),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 52, 39, 67),
              boxShadow: const [
                BoxShadow(
                  color: primaryBackground,
                )
              ],
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: secondaryBackground,
                width: 0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  12, 8, 12, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    // book cover image bang
                    child: Image.asset(
                      imagePath?? "assests/Icons/logo.png",
                      width: 105,
                      height: 135,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          // nama buku
                          Text(
                            judul,
                            style: headlineSmall,
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: categoryColor,
                                      borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(
                                                  20))),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(
                                            8.0, 2, 8, 2),
                                    // genre taruh sini
                                    child: Text(
                                      'Genre',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: 12,
                                        fontFamily: "Readex",
                                        fontWeight:
                                            FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                            child: SelectionArea(
                              // Deskripsi 
                                child: Text(
                              deskripsi,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: labelMedium,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: secondaryText,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}