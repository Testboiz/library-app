import 'package:flutter/material.dart';

class BookOfTheWeekCard extends StatefulWidget {
  const BookOfTheWeekCard({super.key});

  @override
  State<BookOfTheWeekCard> createState() => _BookOfTheWeekCardState();
}

class _BookOfTheWeekCardState extends State<BookOfTheWeekCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      constraints: const BoxConstraints(
        maxHeight: 205,
      ),
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  color: const Color(0xFF342743),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 7,
                      color: Color(0x2F1D2429),
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1569074187119-c87815b476da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                          width: double.infinity,
                          height: 114,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'NamaBukubg.',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 12,
                                fontFamily: "Readex",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
    );
  }
}
