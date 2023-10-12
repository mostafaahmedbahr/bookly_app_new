import 'package:bookly_app/core/use_cases/use_case_with_no_param.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';
import '../entites/book_entity.dart';

// class FetchNewestUseCase
// {
//   final HomeRepo homeRepo;
//   FetchNewestUseCase(this.homeRepo);
//
//
//   // ممكن نسميها اى اسم معبر عشان اللغبطة
//   // call
//   //fetchNewestBooks
//   Future<Either< Errors, List<BookEntity>>> call() async{
//
//     return await homeRepo.fetchNewestBooks();
//   }
// }

class FetchNewestUseCase extends UseCaseWithNoParam<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewestUseCase(this.homeRepo);

  @override
  Future<Either<Errors, List<BookEntity>>> call()async {

    return await homeRepo.fetchNewestBooks();

  }
}
