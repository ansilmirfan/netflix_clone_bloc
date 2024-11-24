part of 'detailedmovie_bloc.dart';

@immutable
sealed class DetailedmovieState {}

final class DetailedmovieInitial extends DetailedmovieState {}

final class DetailedmovieLoadingState extends DetailedmovieState {}

final class DetailedmovieCompletedState extends DetailedmovieState {
  MoviesDetaisModel data;
  String youtubeId;
  DetailedmovieCompletedState(this.data, this.youtubeId);
}

final class DetailedSeriesCompletedState extends DetailedmovieState {
  TvSeriesDetailsModel data;
  String youtubeId;
  DetailedSeriesCompletedState(this.data, this.youtubeId);
}

final class DetailedmovieErrorState extends DetailedmovieState {}
