import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';

abstract class HomeRepo{

  Future<Either< Errors, List<BookEntity>>> fetchAllBooks();
  Future<Either< Errors, List<BookEntity>>> fetchNewestBooks();

}