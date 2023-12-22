import 'package:library_app/model/book.dart';

class Member {
  final String id;
  final String name;
  final String tingkatMember;
  final int sisaPinjam;
  final List<Book> books;

  Member(
      {required this.id,
      required this.name,
      required this.tingkatMember,
      required this.sisaPinjam,
      required this.books});
}
