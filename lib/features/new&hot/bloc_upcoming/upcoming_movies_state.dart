part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesState {}

final class UpcomingMoviesInitialState extends UpcomingMoviesState {}

final class UpcomingMoviesLoadingState extends UpcomingMoviesState {}

final class UpcomingMoviesCompletedState extends UpcomingMoviesState {
  List<Result> data;
  UpcomingMoviesCompletedState(this.data);
}
final class UpcomingMoviesErrorState extends UpcomingMoviesState{}
