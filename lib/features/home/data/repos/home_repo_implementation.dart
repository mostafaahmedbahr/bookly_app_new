import 'package:bookly_app/core/errors/error_class.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation extends HomeRepo
{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation({required this.homeRemoteDataSource,required this.homeLocalDataSource});
  @override
  Future<Either<Errors, List<BookEntity>>> fetchAllBooks() async{
    try{
      var cashedBooksList = homeLocalDataSource.fetchAllBooks();
      if(cashedBooksList.isNotEmpty){
        return right(cashedBooksList);
      }
      dynamic books = homeRemoteDataSource.fetchAllBooks();
      return right(books);
    }catch(error)
    {
      return left(Errors());
    }
  }

  @override
  Future<Either<Errors, List<BookEntity>>> fetchNewestBooks() async{
    try{
      var cashedBooksList = homeLocalDataSource.fetchNewestBooks();
      if(cashedBooksList.isNotEmpty){
        return right(cashedBooksList);
      }
      dynamic books = homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    }catch(error)
    {
      return left(Errors());
    }
  }

}