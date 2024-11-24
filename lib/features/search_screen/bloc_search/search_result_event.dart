part of 'search_result_bloc.dart';

@immutable
sealed class SearchResultEvent {}

final class SearchResultInitilaEvent extends SearchResultEvent {}

class SearchQueryChangedEvent extends SearchResultEvent {
  String? query;
  SearchQueryChangedEvent(this.query);
}
