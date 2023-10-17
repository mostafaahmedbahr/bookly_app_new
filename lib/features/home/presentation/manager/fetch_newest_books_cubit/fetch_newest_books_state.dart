part of 'fetch_newest_books_cubit.dart';

@immutable
abstract class FetchNewestBooksStates {}

class FetchNewestBooksInitial extends FetchNewestBooksStates {}

class FetchNewestBooksLoadingState extends FetchNewestBooksStates {}
class FetchNewestBooksSuccessState extends FetchNewestBooksStates {}
class FetchNewestBooksErrorState extends FetchNewestBooksStates {
  final String error;
  FetchNewestBooksErrorState( this.error);

}
