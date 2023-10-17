part of 'fetch_all_books_cubit.dart';

@immutable
abstract class FetchAllBooksStates {}

class FetchAllBooksInitial extends FetchAllBooksStates {}

class FetchAllBooksLoadingState extends FetchAllBooksStates {}
class FetchAllBooksSuccessState extends FetchAllBooksStates {}
class FetchAllBooksErrorState extends FetchAllBooksStates {
  final String error ;
  FetchAllBooksErrorState(this.error);
}
