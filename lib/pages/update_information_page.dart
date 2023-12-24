import 'package:flutter/material.dart';
import 'package:library_app/item-generators/member_card.dart';

import '../constants/costum_color.dart';

class MemberInformationPage extends StatefulWidget {
  const MemberInformationPage({super.key});

  @override
  State<MemberInformationPage> createState() => _MemberInformationPageState();
}

class _MemberInformationPageState extends State<MemberInformationPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: secondaryBackground,
      appBar: AppBar(
        backgroundColor: const Color(0x004B39EF),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.white60,
              size: 30,
            )),
        title: const Text(
          'Profile',
          style: headlineXSmall,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2E273A),
                secondaryBackground,
              ],
              stops: [0, 0.5],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0x00381D6C),
                        ),
                        child: const MemberCard(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Book ',
                                style: TextStyle(
                                    fontFamily: 'Readex',
                                    color: Color(0xFFF3B06A),
                                    fontSize: 18),
                              ),
                            ),
                            Text(
                              'Status',
                              style: TextStyle(
                                  fontFamily: 'Readex',
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                        child: Container(
                          width: double.infinity,
                          height: 118,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 8, 16, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://picsum.photos/seed/240/600',
                                    width: 75,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 15),
                                            child: Text(
                                              'judul Bang..',
                                              style: bodyLarge,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Deadline 30 Desember 2023',
                                          style: bodyMedium,
                                        ),
                                        Text(
                                          '3 hari lagi',
                                          style: bodyMedium,
                                        ),
                                      ],
                                    ),
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
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'MemberName ',
                        style: TextStyle(
                            fontFamily: 'Readex',
                            color: Color(0xFFF3B06A),
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Information',
                        style: TextStyle(
                            fontFamily: 'Readex',
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 16, 0, 0),
                              child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'New name',
                                  labelStyle: labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  filled: true,
                                  fillColor: secondaryBackground,
                                ),
                                style: bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 16, 0, 0),
                              child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  labelStyle: labelMedium,
                                  hintStyle: labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  filled: true,
                                  fillColor: secondaryBackground,
                                ),
                                style: bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 16, 20, 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(double.infinity, 60),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                width: 2,
                                color: tertiary,
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(tertiary),
                          ),
                          child: const Text(
                            'Save Changes',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
