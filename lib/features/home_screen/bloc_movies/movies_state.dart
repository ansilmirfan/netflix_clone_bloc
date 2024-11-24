part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesCompletedState extends MoviesState {
  List<Result> data;
  MoviesCompletedState(this.data);
}
class MoviesErrorState extends MoviesState{}