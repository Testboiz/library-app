import 'package:flutter/material.dart';
import 'package:library_app/item-generators/db_tools.dart';
import 'package:library_app/pages/update_information_page.dart';

import '../constants/costum_color.dart';

class MemberCard extends StatefulWidget {
  const MemberCard(
      {super.key,
      required this.father,
      required this.id,
      required this.name,
      required this.tingkat,
      required this.sisaPinjam,
      required this.tglBalik,
      this.callback = _doNothing});
  final String father;
  final String id;
  final String name;
  final String tingkat;
  final int sisaPinjam;
  final String? tglBalik;
  final VoidCallback callback;
  static void _doNothing() {}
  @override
  State<MemberCard> createState() => _MemberCardState();
}


class _MemberCardState extends State<MemberCard> {
  int lamaSisaPinjam = -1;

  void _setMaxLamaPinjam(){
    Future.delayed(Duration.zero, () async {
      lamaSisaPinjam = await MySQLDBFunctions.getMaxWaktuPinjam(widget.id);
      setState(() {});
    });
  }
  @override
  void initState(){
    _setMaxLamaPinjam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.father != "profile") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MemberInformationPage(
                    id: widget.id,
                    callback: widget.callback,
                  )));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          width: 370,
          height: 160,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 6,
                color: Color(0x4B1A1F24),
                offset: Offset(0, 2),
              )
            ],
            gradient: const LinearGradient(
              colors: [tertiary, categoryColor],
              stops: [0, 1],
              begin: AlignmentDirectional(0.94, -1),
              end: AlignmentDirectional(-0.94, 1),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.id.toString(),
                  style: headlineSmall,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 140,
                          child: Text(
                            widget.name,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Readex",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          widget.tingkat,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Readex",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      'Sisa Pinjam   : ',
                                      style: bodyMedium,
                                    ),
                                  ),
                                  Text(
                                    'Lama Pinjam : ',
                                    style: bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                    child: Text(
                                      widget.sisaPinjam.toString(),
                                      style: bodyMedium,
                                    ),
                                  ),
                                  Text(
                                    lamaSisaPinjam.toString(),
                                    style: bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
