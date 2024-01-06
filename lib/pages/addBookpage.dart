// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_app/item-generators/database_widget_generator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/costum_color.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {

  List<Map> genre = [];

  @override
  void initState() {
    setGenre();
    super.initState();
  }
  void setGenre() {
    Future.delayed(Duration.zero, () async {
      genre = await DatabaseWidgetGenerator.toGenreMap();
      setState(() {
      });
    });
  }
  
  TextEditingController namaBukuController = TextEditingController();
  TextEditingController synopsisController = TextEditingController();
  String bookCoverPath = "assests/Icons/logo.png";
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
                              child: Image(
                                image: bookCoverPath.startsWith('assests/')
                                    ? AssetImage(bookCoverPath) 
                                    : FileImage(File(bookCoverPath)) as ImageProvider,
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
                              onPressed: () async {
                                // TODO Upload Foto bang bang
                                var imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);

                                if (imagePicker != null) {
                                  // this 
                                  final appDirectory = await getApplicationDocumentsDirectory();
                                  // Create a new file path within the app's documents directory
                                  final filePath = '${appDirectory.path}/${imagePicker.name}';
                                  final fileFromXFile = imagePicker.path;
                                  // Save the picked image to the specified path
                                  await File(filePath).writeAsBytes(File(fileFromXFile).readAsBytesSync());
                                  setState(() {
                                    bookCoverPath = filePath;
                                  });

                                }

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
                            controller: namaBukuController,
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
                            keyboardType: TextInputType.text,
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
                  children:  genre.map((e) {
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
                      controller: synopsisController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Book Synopsis',
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
                        onPressed: () {
                          if(namaBukuController.text.isEmpty){
                            return;
                          }
                          DatabaseWidgetGenerator.addBuku(
                            namaBukuController.text, 
                            synopsisController.text,
                            bookCoverPath, 
                            genre);
                          
                          //TODO add SQL function call here
                          // remember to do a callback
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
