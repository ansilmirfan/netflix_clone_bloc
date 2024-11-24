part of 'recommeded_movies_bloc.dart';

@immutable
sealed class RecommendedMoviesEvent {}

final class RecommendedMoviesInitialEvent extends RecommendedMoviesEvent {
  int id;
  RecommendedMoviesInitialEvent(this.id);
}

final class RecommendedSeriesEvent extends RecommendedMoviesEvent {
  int id;
  RecommendedSeriesEvent(this.id);
}
