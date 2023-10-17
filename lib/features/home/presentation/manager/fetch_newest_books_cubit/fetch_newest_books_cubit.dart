 import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksStates> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase) : super(FetchNewestBooksInitial());

  static FetchNewestBooksCubit get(context)=> BlocProvider.of(context);

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> getNewestBooksDataInCubit()async
  {
    emit(FetchNewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((l){
      emit(FetchNewestBooksErrorState(l.toString()));
    }, (r){
      emit(FetchNewestBooksSuccessState());
    });
  }

}
