import '../../domain/entites/book_entity.dart';

class BookModel extends BookEntity {
  BookModel(
      {required super.bookId,
      required super.image,
      required super.title,
      required super.autherName,
      required super.price,
      required super.rate});


  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
      bookId: json['id'],
      image: json['smallThumbnail'],
      title: json['title'],
      autherName: json['publisher'],
      price: json['amount'],
      rate: json['averageRating'],

  );
}
