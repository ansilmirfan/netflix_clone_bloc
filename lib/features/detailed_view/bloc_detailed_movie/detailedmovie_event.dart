part of 'detailedmovie_bloc.dart';

@immutable
sealed class DetailedmovieEvent {}

class DetailedMovieInitialEvent extends DetailedmovieEvent {
  int id;

  DetailedMovieInitialEvent(this.id);
}

class DetailedTvSeriesInitialEvent extends DetailedmovieEvent {
  int id;
  DetailedTvSeriesInitialEvent(this.id);
}
