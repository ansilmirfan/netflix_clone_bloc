part of 'recommeded_movies_bloc.dart';

@immutable
sealed class RecommendedMoviesState {}

final class RecommededMoviesInitial extends RecommendedMoviesState {}

final class RecommendedMoviesLoadingState extends RecommendedMoviesState {}

final class RecommendedMoviesCompletedState extends RecommendedMoviesState {
  List<Result> data;
  
  RecommendedMoviesCompletedState(this.data);
}

final class RecommendedMoviesErrorState extends RecommendedMoviesState {}
