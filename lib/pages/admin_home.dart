import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/pages/detail.dart';
import 'package:library_app/pages/login.dart';
import 'package:library_app/widgets/book_card.dart';
import 'package:library_app/widgets/kategori.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageWidgetState createState() => _AdminHomePageWidgetState();
}

class _AdminHomePageWidgetState extends State<AdminHomePage> {
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
      body: SafeArea(
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
                          ),
                        ),
                        Text(
                          'gories',
                          style: bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
                            builder: (context) => const DetailPage()));
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.83,
                    ),
                    scrollDirection: Axis.vertical,
                    children: const [
                      BookCard(
                        parent: "admin",
                        judul: 'hai',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
