import 'package:flutter/material.dart';

import '../constants/costum_color.dart';

class AdminMemberCard extends StatefulWidget {
  const AdminMemberCard(
      {super.key, required this.nama, required this.pass, this.imagePath});
  final String nama;
  final String pass;
  final String? imagePath;

  @override
  State<AdminMemberCard> createState() => _AdminMemberCardState();
}

class _AdminMemberCardState extends State<AdminMemberCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color: secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3B1D2429),
                    offset: Offset(0, -3),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Generated code for this Row Widget...
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1515871204537-49a5fe66a31f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8ZmlyZXdvcmtzfGVufDB8fHx8MTcwMzI5NjkwOXww&ixlib=rb-4.0.3&q=80&w=1080',
                            width: 107,
                            height: 109,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Text('Username ',
                                              maxLines: 2, style: bodyMedium),
                                        ),
                                        Text(
                                          'P******rd',
                                          maxLines: 4,
                                          style: bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 79,
                                      height: 79,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          'Tingkatnya',
                                          style: bodyMedium,
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

                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 60),
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(
                                    width: 2,
                                    color: warning,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    primaryBackground),
                              ),
                              child: const Text(
                                'Update Member Information',
                                style: TextStyle(
                                  color: warning,
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 60),
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(
                                    width: 2,
                                    color: error,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    primaryBackground),
                              ),
                              child: const Text(
                                'Delete Member',
                                style: TextStyle(
                                  color: error,
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 60),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 175, 175, 175),
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
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 14),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF342743),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0x00342743),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person,
                                color: const Color.fromARGB(220, 255, 255, 255),
                                size: 24,
                              ),
                            ),
                          ),
                          Text(
                            'UserName',
                            style: bodyLarge,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Tingkat',
                            style: labelMedium,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Text(
                                  'tingkatnya',
                                  style: headlineXSmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
