import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entites/book_entity.dart';

abstract class HomeLocalDataSource{

  List<BookEntity> fetchAllBooks();
  List<BookEntity> fetchNewestBooks();

}


class HomeLocalDataSourceImplement extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchAllBooks() {
    var box =   Hive.box<BookEntity>('books');
    return box.values.toList();

  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box =   Hive.box<BookEntity>('books');
    return box.values.toList();
  }

}