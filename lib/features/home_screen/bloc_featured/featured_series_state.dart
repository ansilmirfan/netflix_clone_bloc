part of 'featured_series_bloc.dart';

@immutable
sealed class FeaturedSeriesState {}

final class FeaturedSeriesInitial extends FeaturedSeriesState {}

final class FeaturedSeriesLoadingState extends FeaturedSeriesState {}

final class FeaturedSeriesCompletedState extends FeaturedSeriesState {
  SearchSeries data;
  FeaturedSeriesCompletedState(this.data);
}
final class FeaturedSeiresErrorState extends FeaturedSeriesState{}
