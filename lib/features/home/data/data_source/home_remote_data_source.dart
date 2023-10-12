import 'package:bookly_app/core/errors/error_class.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteDataSource extends HomeRepo
{
  @override
  Future<Either<Errors, List<BookEntity>>> fetchAllBooks() {
    // TODO: implement fetchAllBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Errors, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}