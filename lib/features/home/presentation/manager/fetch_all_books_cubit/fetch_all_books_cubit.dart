 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_all_books_use_case.dart';

part 'fetch_all_books_state.dart';

class FetchAllBooksCubit extends Cubit<FetchAllBooksStates> {
  FetchAllBooksCubit(this.fetchAllBooksUseCase) : super(FetchAllBooksInitial());

  static FetchAllBooksCubit get(context) => BlocProvider.of(context);


  final FetchAllBooksUseCase fetchAllBooksUseCase;

  // الكيبوت يمعمل mamange لل state وبيجيب الفانكنش من ال usecase
  Future<void> getAllBooksInCubit()
  async {
    emit(FetchAllBooksLoadingState());
    var result = await fetchAllBooksUseCase.call();
    result.fold((l){
      emit(FetchAllBooksErrorState(l.toString()));
    }, (r){
      emit(FetchAllBooksSuccessState());
    });
  }
}
