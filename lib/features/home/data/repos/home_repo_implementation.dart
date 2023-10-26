import 'package:bookly_app/core/errors/error_class.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Errors, List<BookEntity>>> fetchAllBooks() async {
    try {
      dynamic books;
      books = homeLocalDataSource.fetchAllBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = homeRemoteDataSource.fetchAllBooks();
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerError.fromDioError(error));
      } else {
        return left(ServerError(error: error.toString()));
      }
    }
  }

  @override
  Future<Either<Errors, List<BookEntity>>> fetchNewestBooks() async {
    try {
      dynamic books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerError.fromDioError(error));
      } else {
        return left(ServerError(error: error.toString()));
      }
    }
  }
}
