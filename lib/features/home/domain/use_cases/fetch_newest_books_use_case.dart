import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';
import '../entites/book_entity.dart';

class FetchNewestUseCase
{
  final HomeRepo homeRepo;
  FetchNewestUseCase(this.homeRepo);


  Future<Either< Errors, List<BookEntity>>> fetchNewestBooks(){

    return homeRepo.fetchNewestBooks();
  }
}