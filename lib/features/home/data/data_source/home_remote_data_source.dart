import 'package:bookly_app/core/errors/error_class.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeRemoteDataSource extends HomeRepo {
  final ApiServices apiServices;

  BookModel? bookModel;
  HomeRemoteDataSource(this.apiServices,   this.bookModel);

  @override
  Future<Either<Errors, List<BookEntity>>> fetchAllBooks({
      String? booksType,
  }) async {
    var data = await apiServices
        .getData(
      url: "volumes?q=$booksType",
    )
        .then((value) async {
          bookModel = BookModel.fromJson(value.data);
          print("mostafa 1");
          List<BookEntity> booksList = [];
          for(var bookMap in value.data["items"]){
            booksList.add(Item.fromJson(bookMap));
          }

      print(value.data);
          print("mostafa 2");
          print(booksList);
          print("mostafa 3");
          var box = Hive.box('books');
          box.addAll(booksList);
          print("mostafa 4");
    }).catchError((error) {
      print(error.toString());
    });
    return data;
  }

  @override

  Future<Either<Errors, List<BookEntity>>> fetchNewestBooks({
    String? booksType,
  }) async {
    var data = await apiServices
        .getData(
      url: "volumes?Sorting=newest&q=$booksType",
    )
        .then((value) {
      bookModel = BookModel.fromJson(value.data);
      print("mostafa 1");
      List<BookEntity> booksList = [];
      for(var bookMap in value.data["items"]){
        booksList.add(Item.fromJson(bookMap));
      }

      print(value.data);
      print("mostafa 2");
      print(booksList);
      print("mostafa 3");
      var box = Hive.box('newestBooks');
      box.addAll(booksList);
      print("mostafa 4");
    }).catchError((error) {
      print(error.toString());
    });
    return data;
  }
}
