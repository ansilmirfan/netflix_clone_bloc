part of 'search_result_bloc.dart';

@immutable
sealed class SearchResultState {}

final class SearchResultInitial extends SearchResultState {}

final class SearchResultLoadingstate extends SearchResultState {}

final class SearchResultCompletedState extends SearchResultState {
  List<Result> data;
  SearchResultCompletedState(this.data);
}

final class SearchResultErrorState extends SearchResultState {}
