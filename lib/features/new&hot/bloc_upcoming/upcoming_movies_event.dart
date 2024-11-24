part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesEvent {}

final class UpcomingMoviesIntialEvent extends UpcomingMoviesEvent {}

final class TopRatedSeriesEvent extends UpcomingMoviesEvent {}
