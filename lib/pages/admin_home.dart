import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/item-generators/admin_member_card.dart';
import 'package:library_app/pages/addBookpage.dart';
import 'package:library_app/item-generators/book_card.dart';
import 'package:library_app/widgets/kategori.dart';
import 'package:library_app/item-generators/member_card.dart';
import 'package:library_app/item-generators/database_widget_generator.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  AdminHomePageWidgetState createState() => AdminHomePageWidgetState();
}

class AdminHomePageWidgetState extends State<AdminHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: secondaryText,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF251B40),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Image.asset(
                    'assests/Icons/logo.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'README.BOOK',
                  style: headlineSmall,
                ),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'ADMIN',
                  style: TextStyle(
                    fontFamily: 'Readex',
                    color: Color(0xFFF2AA64),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Panel',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Readex',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF241243),
                  primaryBackground,
                ],
                stops: [0, 0.6],
                begin: AlignmentDirectional(-0.87, -1),
                end: AlignmentDirectional(0.87, 1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(14, 12, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Cate',
                            style: TextStyle(
                                fontFamily: 'Readex',
                                color: Color(0xFFF3B06A),
                                fontSize: 18),
                          ),
                          Text(
                            'gories',
                            style: TextStyle(
                                fontFamily: 'Readex',
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 17.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  width: double.infinity,
                                  height: 493,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 10, 16),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(),
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    autofocus: true,
                                                    autofillHints: const [
                                                      AutofillHints.name
                                                    ],
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Category Name',
                                                      labelStyle: labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: alternate,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: primary,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: error,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: error,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          secondaryBackground,
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              24),
                                                    ),
                                                    style: bodyMedium,
                                                    keyboardType:
                                                        TextInputType.text,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // Bang rio isi bang/....
                                              },
                                              icon: const Icon(
                                                  Icons.check_rounded),
                                              color: tertiary,
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          const EdgeInsets
                                                              .fromLTRB(
                                                              17, 0, 24, 0)),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          const CircleBorder()),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          const Size(57, 57))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 16, 0, 0),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      const Size(
                                                          double.infinity, 60),
                                                    ),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                  ),
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 175, 175, 175),
                                                      fontSize: 16,
                                                      fontFamily: "Readex",
                                                      fontWeight:
                                                          FontWeight.w500,
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
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 247, 187, 122)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(8, 0, 17, 0)),
                            fixedSize:
                                MaterialStateProperty.all(const Size(115, 31))),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Category",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Readex",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 16, 49, 74),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          Category(),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 17.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddBookPage()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 247, 187, 122)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(8, 0, 17, 0)),
                            fixedSize:
                                MaterialStateProperty.all(const Size(90, 26))),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Book",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Readex",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                //   child: GridView(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     padding: EdgeInsets.zero,
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 3,
                //       crossAxisSpacing: 10,
                //       mainAxisSpacing: 10,
                //       childAspectRatio: 0.83,
                //     ),
                //     // scrollDirection: Axis.vertical,
                //     children: const [
                //       BookCard(parent: "admin", judul: 'hai',sinopsis: "hihi",),
                //       BookCard(parent: "admin", judul: 'hai',sinopsis: "hihi"),
                //       BookCard(parent: "admin", judul: 'hai',sinopsis: "hihi"),
                //       BookCard(parent: "admin", judul: 'hai',sinopsis: "hihi"),
                //       BookCard(parent: "admin", judul: 'hai',sinopsis: "hihi"),
                //       BookCard(parent: "admin", judul: 'hai',sinopsis: "hihi"),
                //     ],
                //   )
                // ),
                SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: DatabaseWidgetGenerator.makeBookCards("admin"),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(14, 12, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Member',
                        style: TextStyle(
                            fontFamily: 'Readex',
                            color: Color(0xFFF3B06A),
                            fontSize: 18),
                      ),
                      Text(
                        ' Information',
                        style: TextStyle(
                            fontFamily: 'Readex',
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      AdminMemberCard(nama: "nama", pass: "pass"),
                      AdminMemberCard(nama: "nama", pass: "pass"),
                      AdminMemberCard(nama: "nama", pass: "pass"),
                      AdminMemberCard(nama: "nama", pass: "pass"),
                      AdminMemberCard(nama: "nama", pass: "pass"),
                      AdminMemberCard(nama: "nama", pass: "pass"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
