import 'package:flutter/material.dart';
import 'package:library_app/item-generators/db_tools.dart';

import '../constants/costum_color.dart';

class UpdateMemberViaAdmin extends StatefulWidget {
  const UpdateMemberViaAdmin({super.key, required this.idMember, required this.callback});
  final String idMember;
  final VoidCallback callback;
  @override
  State<UpdateMemberViaAdmin> createState() => _UpdateMemberViaAdminState();
}

class _UpdateMemberViaAdminState extends State<UpdateMemberViaAdmin> {
  bool isHide = true;
  bool isHideConfirm = true;
  int? selectedIdTingkat = 1;
  List<Map<String,dynamic>> tingkat = [];
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _setTingkat(){
    Future.delayed(Duration.zero, () async {
      tingkat = await MySQLDBFunctions.toTingkatList();
      setState(() {});
    });
  }

  @override
  void initState(){
    _setTingkat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Edit Member',
          style: headlineXSmall,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller:namaController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'New Username',
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'New E-mail',
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                                onTap: () => {setState(() => isHide = !isHide)},
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: DropdownButtonFormField(
                            items: tingkat.map<DropdownMenuItem<String>>(
                              (Map value) {
                                return DropdownMenuItem<String>(
                                  value: value["id_tingkat"].toString(),
                                  child: Text(value["nama_tingkat"], 
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 16,
                                    fontFamily: "Readex",
                                    fontWeight: FontWeight.w100,
                                  ),),
                                );
                              },
                            ).toList(),
                            onChanged: (e)  {
                              setState(() => selectedIdTingkat = int.tryParse(e ?? "1"));
                            },
                            
                            decoration: InputDecoration(
                              labelText: 'Tingkat',
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
                            ),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(40, 16, 40, 20),
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
                                    )),
                                TextButton(
                                  onPressed: () async {
                                    // defaults to Newbie
                                    MySQLDBFunctions.changeMemberInfoAdmin(
                                         idMember: widget.idMember,
                                         username: namaController.text,
                                         password: passwordController.text,
                                         email: emailController.text,
                                         idTingkatBaru: selectedIdTingkat ?? 1);
                                    // keluar sampai home page yang belum login
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  },
                                  child: const Text(
                                    "Yakin",
                                    style: TextStyle(
                                      color: error,
                                      fontSize: 14,
                                      fontFamily: "Readex",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
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
                        backgroundColor: MaterialStateProperty.all(tertiary),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
