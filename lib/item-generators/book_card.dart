import 'package:flutter/material.dart';
import 'package:library_app/item-generators/database_widget_generator.dart';
import 'package:library_app/pages/login.dart';
import 'package:library_app/widgets/kategori_text.dart';

import '../constants/costum_color.dart';

class BookCard extends StatefulWidget {
  final String parent;
  final String judul;
  final String sinopsis;
  final String? imagePath;
  final int idBuku;
  final String? idMember;
  final List<String> genre;
  const BookCard(
      {super.key,
      required this.parent,
      required this.judul,
      required this.sinopsis,
      required this.idBuku,
      this.imagePath,
      this.idMember,
      required this.genre,
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
                              child: Image.asset(
                                widget.imagePath ?? "assests/Icons/logo.png",
                                width: 107,
                                height: 152,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 6, 0, 10),
                                      child: SizedBox(
                                        height: 20,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: widget.genre.length,
                                          itemBuilder: (context, index) {
                                            return KategoriText(
                                              namaGenre: widget.genre[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.sinopsis,
                                      maxLines: 4,
                                      style: bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color: warning,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryBackground),
                                  ),
                                  child: const Text(
                                    'Login untuk meminjam',
                                    style: TextStyle(
                                      color: warning,
                                      fontSize: 16,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
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
              child: Image.asset(
                widget.imagePath ?? "assests/Icons/logo.png",
                width: 107,
                height: 152,
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
                              child: Image.asset(
                                widget.imagePath ?? "assests/Icons/logo.png",
                                width: 107,
                                height: 152,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 6, 0, 10),
                                      child: SizedBox(
                                        height: 20,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: false,
                                          itemCount: widget.genre.length,
                                          itemBuilder: (context, index) {
                                            return KategoriText(
                                              namaGenre: widget.genre[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.sinopsis,
                                      maxLines: 4,
                                      style: bodyMedium,
                                      overflow: TextOverflow.ellipsis,
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
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: primary,
                                          title: const Text(
                                            "Apakah Kamu Yakin??",
                                            style: bodyLarge,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Belum",
                                                style: labelMedium,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  print("masuk");
                                                  setState(() {
                                                    DatabaseWidgetGenerator
                                                        .deleteBuku(
                                                            widget.idBuku);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Yakin",
                                                  style: TextStyle(
                                                    color: error,
                                                    fontSize: 14,
                                                    fontFamily: "Readex",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                          ],
                                        );
                                      },
                                    );
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
              child: Image.asset(
                widget.imagePath ?? "assests/Icons/logo.png",
                width: 107,
                height: 152,
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
                              child: Image.asset(
                                widget.imagePath ?? "assests/Icons/logo.png",
                                width: 107,
                                height: 152,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 6, 4, 10),
                                      child: SizedBox(
                                        height: 20,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: false,
                                          itemCount: widget.genre.length,
                                          itemBuilder: (context, index) {
                                            return KategoriText(
                                              namaGenre: widget.genre[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.sinopsis,
                                      maxLines: 4,
                                      style: bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      DatabaseWidgetGenerator.pinjamBuku(
                                        widget.idMember, widget.idBuku);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Buku Sudah Dipinjam!")));
                                    Navigator.of(context).pop();
                                  },
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
                                    'Pinjam buku ini',
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
                child: Image.asset(
                  widget.imagePath ?? "assests/Icons/logo.png",
                  width: 107,
                  height: 152,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }
      return const Text("no more book");
    }
  }
}
