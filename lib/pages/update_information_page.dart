import 'package:flutter/material.dart';
import 'package:library_app/item-generators/borrowed_book_card.dart';
import 'package:library_app/item-generators/database_widget_generator.dart';
import 'package:library_app/item-generators/member_card.dart';

import '../constants/costum_color.dart';

class MemberInformationPage extends StatefulWidget {
  const MemberInformationPage({super.key, required this.id});
  final String id;

  @override
  State<MemberInformationPage> createState() => _MemberInformationPageState();
}

class _MemberInformationPageState extends State<MemberInformationPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isHide = true;
  bool isHideConfirm = true;
  TextEditingController namaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                            const BorrowedBookCard(),
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
                                controller: namaController,
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
                                controller: passwordController,
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
                                controller: confirmPasswordController,
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
                          onPressed: () {
                            if (namaController.text.isEmpty && passwordController.text.isEmpty && confirmPasswordController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data Tidak Bolek Kosong")));
                              return;
                            }
                            if (passwordController.text != confirmPasswordController.text){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Tidak Cocok")));
                              return;
                            }
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
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          DatabaseWidgetGenerator.changeMemberInfo(widget.id, namaController.text, passwordController.text);
                                          // keluar sampai home page yang belum login
                                          Navigator.of(context).popUntil((route) => route.isFirst);
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
