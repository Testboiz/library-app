import 'package:flutter/material.dart';
import 'package:library_app/pages/home.dart';
import 'package:library_app/pages/login.dart';
import 'package:library_app/widgets/kategori_text.dart';

import '../constants/costum_color.dart';

class BookCard extends StatefulWidget {
  final String parent;
  final String judul;
  final String? imagePath;
  const BookCard({
    super.key,
    required this.parent,
    required this.judul,
    this.imagePath,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.parent == "home") {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: 360,
                  decoration: const BoxDecoration(
                    color: secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3B1D2429),
                        offset: Offset(0, -3),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/512/600',
                                width: 107,
                                height: 152,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.judul,
                                      maxLines: 2,
                                      style: bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6, 0, 10),
                                      child: KategoriText(),
                                    ),
                                    Text(
                                      'Sinopsis',
                                      maxLines: 4,
                                      style: bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 2,
                                        color: error,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryBackground),
                                  ),
                                  child: const Text(
                                    'Login to Borrow book',
                                    style: TextStyle(
                                      color: error,
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 175, 175, 175),
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
          child: Container(
            width: 209,
            height: 139,
            decoration: BoxDecoration(
              color: const Color(0xFF342743),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/628/600',
                width: 280,
                height: 136,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } else if (widget.parent == "admin") {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: 430,
                  decoration: const BoxDecoration(
                    color: secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3B1D2429),
                        offset: Offset(0, -3),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/512/600',
                                width: 107,
                                height: 152,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.judul,
                                      maxLines: 2,
                                      style: bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6, 0, 10),
                                      child: KategoriText(),
                                    ),
                                    Text(
                                      'Sinopsis',
                                      maxLines: 4,
                                      style: bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 2,
                                        color: warning,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryBackground),
                                  ),
                                  child: const Text(
                                    'Update Book Information',
                                    style: TextStyle(
                                      color: warning,
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 2,
                                        color: error,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryBackground),
                                  ),
                                  child: const Text(
                                    'Delete Book',
                                    style: TextStyle(
                                      color: error,
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 175, 175, 175),
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
          child: Container(
            width: 209,
            height: 139,
            decoration: BoxDecoration(
              color: const Color(0xFF342743),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/628/600',
                width: 280,
                height: 136,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } else {
      if (widget.parent == "member") {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3B1D2429),
                        offset: Offset(0, -3),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/512/600',
                                width: 107,
                                height: 152,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.judul,
                                      maxLines: 2,
                                      style: bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6, 0, 10),
                                      child: KategoriText(),
                                    ),
                                    Text(
                                      'Sinopsis',
                                      maxLines: 4,
                                      style: bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryBackground),
                                  ),
                                  child: const Text(
                                    'Pinjam',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 60),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 175, 175, 175),
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Container(
              width: 209,
              height: 139,
              decoration: BoxDecoration(
                color: const Color(0xFF342743),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/628/600',
                  width: 280,
                  height: 136,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }
      return Text("no more book");
    }
  }
}
