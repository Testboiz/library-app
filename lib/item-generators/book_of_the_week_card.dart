import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/pages/login.dart';
import 'package:library_app/widgets/kategori_text.dart';

class BookOfTheWeekCard extends StatefulWidget {
  const BookOfTheWeekCard(
      {super.key, required this.parent, required this.judul, this.imagePath});
  final String parent;
  final String judul;
  final String? imagePath;

  @override
  State<BookOfTheWeekCard> createState() => _BookOfTheWeekCardState();
}

class _BookOfTheWeekCardState extends State<BookOfTheWeekCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.parent == 'member') {
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
        child: Container(
          height: 240,
          constraints: const BoxConstraints(
            maxHeight: 205,
          ),
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
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
                            child: Image.network(
                              'https://images.unsplash.com/photo-1569074187119-c87815b476da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                              width: double.infinity,
                              height: 114,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.judul,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
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
                ),
              ],
            ),
          ),
        ),
      );
    } else if (widget.parent == 'home') {
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
        child: Container(
          height: 240,
          constraints: const BoxConstraints(
            maxHeight: 205,
          ),
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
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
                            child: Image.network(
                              'https://images.unsplash.com/photo-1569074187119-c87815b476da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                              width: double.infinity,
                              height: 114,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.judul,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
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
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const Text("heloo");
  }
}
