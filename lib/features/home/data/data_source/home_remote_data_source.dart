import 'package:bookly_app/core/errors/error_class.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  // هنا بنحدد اى ال مفروض يحصل ونجيب الداتا اى يكن ال Result أى
  Future<List<BookEntity>> fetchAllBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<List<BookEntity>> fetchAllBooks({
    String? booksType,
  }) async {
    var data = await apiServices.getData(url: "volumes?q=computer science",);
    print(data["items"]);
    print("mostafa 0");
    List<BookEntity> booksList = [];
      print("mostafa 1");
      for (var bookMap in data["items"]) {
        booksList.add(BookModel.fromJson(bookMap));
      }
      print("mostafa 2");
      print(booksList);
      print("mostafa 3");
      var box = Hive.box<BookEntity>('books');
      box.addAll(booksList);
      print("mostafa 4");

    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices
        .getData(
      url: "volumes?Sorting=newest&q=computer science",
    )
        .then((value) {
      print("mostafa 1");
      List<BookEntity> booksList = [];
      for (var bookMap in value["items"]) {
        // booksList.add(Items.fromJson(bookMap));
      }

      print(value);
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
