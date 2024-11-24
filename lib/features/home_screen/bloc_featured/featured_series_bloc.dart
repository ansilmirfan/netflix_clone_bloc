import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone_bloc/models.dart/search_series.dart';

import 'package:netflix_clone_bloc/utils/services.dart';
part 'featured_series_event.dart';
part 'featured_series_state.dart';

class FeaturedSeriesBloc
    extends Bloc<FeaturedSeriesEvent, FeaturedSeriesState> {
  FeaturedSeriesBloc() : super(FeaturedSeriesInitial()) {
    on<FeaturedSeriesInitialEvent>(featuredSeriesInitialEvent);
  }

  FutureOr<void> featuredSeriesInitialEvent(FeaturedSeriesInitialEvent event,
      Emitter<FeaturedSeriesState> emit) async {
    emit(FeaturedSeriesLoadingState());
    ApiService apiService = ApiService();
    try {
      SearchSeries data = await apiService.getPopularSeries();
      emit(FeaturedSeriesCompletedState(data));
    } catch (e) {
      emit(FeaturedSeiresErrorState());
    }
  }
}
