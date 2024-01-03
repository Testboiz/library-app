import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/widgets/kategori.dart';
import 'package:library_app/item-generators/member_card.dart';
import 'package:library_app/item-generators/database_widget_generator.dart';

class MemberPage extends StatefulWidget {
  const MemberPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.tingkat,
      required this.sisaPinjam,
      required this.tglBalik})
      : super(key: key);
  final String id;
  final String name;
  final String tingkat;
  final int sisaPinjam;
  final String? tglBalik;

  @override
  MemberPageState createState() => MemberPageState();
}

class MemberPageState extends State<MemberPage> {
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
        backgroundColor: const Color(0xFF251B40),
        automaticallyImplyLeading: false,
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
                const Text('README.BOOK', style: headlineXSmall),
              ],
            ),
          ],
        ),
        actions: const [],
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
              // do this later
              MemberCard(
                id: widget.id,
                name: widget.name,
                tingkat: widget.tingkat,
                sisaPinjam: widget.sisaPinjam,
                tglBalik: widget.tglBalik,
                father: 'member',
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Books ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 243, 177, 106),
                        fontSize: 14,
                        fontFamily: "Readex",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'of the week !',
                      style: bodyMedium,
                    ),
                  ],
                ),
              ),
              DatabaseWidgetGenerator.makeBookOfTheWeekCards("member",
                  idMember: widget.id),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 12, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Gen',
                      style: TextStyle(
                        fontFamily: 'Readex',
                        color: Color(0xFFF3B06A),
                      ),
                    ),
                    Text(
                      're',
                      style: bodyMedium,
                    ),
                  ],
                ),
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
              Expanded(
                  child: DatabaseWidgetGenerator.makeBookCards("member",
                      idMember: widget.id)),
            ],
          ),
        ),
      ),
    );
  }
}
