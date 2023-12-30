// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../constants/costum_color.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  // Masukkin sini rio pake db buat category checkbox buat add book
  // status jadiin false semua karena itu buat check box nya
  // ty wkwk

  List<Map> genre = [
    {'genre': 'All', 'status': false},
    {'genre': 'Educational', 'status': false},
    {'genre': 'Humor', 'status': false},
    {'genre': 'Adventure', 'status': false},
    {'genre': 'Misc', 'status': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Buku",
          style: headlineSmall,
        ),
        backgroundColor: primary,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3B1D2429),
              offset: Offset(0, -3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 8, 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 125,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/433/600',
                                width: 100,
                                height: 132,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1, -1),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Upload Foto bang bang
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(categoryColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 16),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Book Name',
                              labelStyle: labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: alternate,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: primaryBackground,
                              contentPadding: const EdgeInsets.all(24),
                            ),
                            style: bodyMedium,
                            maxLines: 2,
                            minLines: 1,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 40),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  shrinkWrap: true,
                  children: genre.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          e['status'] = !e['status'];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: e['status']
                                ? const Color.fromARGB(255, 29, 21, 51)
                                : cardColor,
                            borderRadius: BorderRadius.circular(23),
                            border: Border.all(
                              width: 2,
                              color: e['status']
                                  ? const Color.fromARGB(255, 94, 67, 168)
                                  : cardColor,
                            )),
                        alignment: Alignment.center,
                        child: Text(
                          e['genre'],
                          style: bodyMedium,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Book Name',
                        labelStyle: labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: primaryBackground,
                        contentPadding: const EdgeInsets.all(24),
                      ),
                      style: bodyMedium,
                      textAlign: TextAlign.start,
                      maxLines: 6,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 16, 40, 20),
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
                          backgroundColor: MaterialStateProperty.all(tertiary),
                        ),
                        child: const Text(
                          'Submit',
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
    );
  }
}
