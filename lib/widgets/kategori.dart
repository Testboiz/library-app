import 'package:flutter/material.dart';
import 'package:library_app/constants/costum_color.dart';
import 'package:library_app/model/member.dart';
import 'package:library_app/pages/admin_home.dart';
import 'package:library_app/pages/home.dart';
import 'package:library_app/pages/member_home.dart';

class Category extends StatefulWidget {
  const Category({super.key, this.genre, this.parent, this.memberInfo});
  final String? genre;
  final String? parent;
  final Member? memberInfo;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: 
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
          child: ElevatedButton(
            onPressed: () {
              if (widget.parent == "home"){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(selectedGenre: widget.genre,)));
              }
              else if (widget.parent == "member"){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MemberPage(id: widget.memberInfo!.id, 
                      name: widget.memberInfo!.name,
                      tingkat: widget.memberInfo!.tingkatMember,
                      sisaPinjam: widget.memberInfo!.sisaPinjam,
                      tglBalik: null,
                      genre: widget.genre,  )));
              }
              else if (widget.parent == "admin"){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminHomePage(selectedGenre: widget.genre,)));
              }
            },

            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              ),
              backgroundColor: MaterialStateProperty.all(categoryColor),
              elevation: MaterialStateProperty.all(3),
              shape: MaterialStateProperty.all(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            child: Text(
              widget.genre ?? "All",
              style: titleSmall,
            ),
          ),
        ),
    );
  }
}
