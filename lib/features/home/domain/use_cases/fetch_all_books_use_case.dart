import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';
import '../entites/book_entity.dart';

class FetchAllBooksUseCase
{
  final HomeRepo homeRepo;
  FetchAllBooksUseCase(this.homeRepo);


  Future<Either< Errors, List<BookEntity>>> fetchAllBooks(){

    return homeRepo.fetchAllBooks();
  }
}