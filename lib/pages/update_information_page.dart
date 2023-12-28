import 'package:flutter/material.dart';
import 'package:library_app/item-generators/borrowed_book_card.dart';
import 'package:library_app/item-generators/member_card.dart';

import '../constants/costum_color.dart';

class MemberInformationPage extends StatefulWidget {
  const MemberInformationPage({super.key});

  @override
  State<MemberInformationPage> createState() => _MemberInformationPageState();
}

class _MemberInformationPageState extends State<MemberInformationPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isHide = true;
  bool isHideConfirm = true;
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
        actions: const [],
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
                        // child: const MemberCard(
                        //   father: "profile",
                        // ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
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
                        child: Column(
                          children: [
                            BorrowedBookCard(),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: primary,
                                        title: const Text(
                                          "Kamu sudah selesai baca?",
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
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                // delete query here mas semua nya mas
                                              },
                                              child: const Text(
                                                "Sudah",
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
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      width: 2,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                      ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(19))),
                                  backgroundColor:
                                      MaterialStateProperty.all(primary),
                                ),
                                child: const Text(
                                  'Kembalikan Semua buku',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "Readex",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                        'Member Name ',
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
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
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
                                obscureText: isHide,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  labelStyle: labelMedium,
                                  hintStyle: labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  filled: true,
                                  fillColor: secondaryBackground,
                                  suffixIcon: InkWell(
                                    onTap: () =>
                                        {setState(() => isHide = !isHide)},
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      isHide
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: secondaryText,
                                      size: 24,
                                    ),
                                  ),
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
                                obscureText: isHideConfirm,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: labelMedium,
                                  hintStyle: labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  filled: true,
                                  fillColor: secondaryBackground,
                                  suffixIcon: InkWell(
                                    onTap: () => {
                                      setState(
                                          () => isHideConfirm = !isHideConfirm)
                                    },
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      isHideConfirm
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: secondaryText,
                                      size: 24,
                                    ),
                                  ),
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
                            40, 16, 40, 20),
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
                            shape: MaterialStateProperty.all(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(27))),
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
