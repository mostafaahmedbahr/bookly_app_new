import 'package:bookly_app/features/home/domain/repos/home_repo.dart';

import '../../domain/entites/book_entity.dart';

abstract class HomeLocalDataSource{

  List<BookEntity> fetchAllBooks();
  List<BookEntity> fetchNewestBooks();

}


class HomeLocalDataSourceImplement extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchAllBooks() {
    // TODO: implement fetchAllBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}