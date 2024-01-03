import 'package:flutter/material.dart';
import 'package:library_app/item-generators/database_widget_generator.dart';

import '../constants/costum_color.dart';

class BorrowedBookCard extends StatefulWidget {
  final String imagePath;
  final String judul;
  final String tglDeadline;
  final int idPeminjaman;
  final String idMember;
  final int idBuku;
  const BorrowedBookCard({super.key,
  required this.imagePath,
  required this.judul,
  required this.tglDeadline,
  required this.idPeminjaman,
  required this.idMember,
  required this.idBuku});

  @override
  State<BorrowedBookCard> createState() => _BorrowedBookCardState();
}

class _BorrowedBookCardState extends State<BorrowedBookCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        height: 122,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imagePath,
                  width: 75,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Text(
                                widget.judul,
                                style: bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Deadline ${widget.tglDeadline}',
                        style: bodyMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '3 hari lagi',
                            style: bodyMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: primary,
                                    title: const Text(
                                      "Kamu sudah Selesai baca?",
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
                                        onPressed: () {
                                          DatabaseWidgetGenerator.kembalikanBuku(widget.idPeminjaman, widget.idBuku, widget.idMember);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Sudah",
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
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                  width: 2,
                                  color: error,
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(primaryBackground),
                            ),
                            child: const Text(
                              'Kembalikan',
                              style: TextStyle(
                                color: error,
                                fontSize: 16,
                                fontFamily: "Readex",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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
