import 'package:library_app/model/genre.dart';

class Book {
  final String id;
  final String judul;
  final String sinopsis;
  final List<Genre> genre;

  Book({
    required this.id,
    required this.judul,
    required this.sinopsis,
    required this.genre,
  });
}
