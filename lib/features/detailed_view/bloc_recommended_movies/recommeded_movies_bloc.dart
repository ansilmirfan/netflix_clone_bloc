import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';
import 'package:netflix_clone_bloc/utils/services.dart';
part 'recommeded_movies_event.dart';
part 'recommeded_movies_state.dart';

class RecommendedMoviesBloc
    extends Bloc<RecommendedMoviesEvent, RecommendedMoviesState> {
  RecommendedMoviesBloc() : super(RecommededMoviesInitial()) {
    on<RecommendedMoviesInitialEvent>(recommendedMoviesEvent);
    on<RecommendedSeriesEvent>(recommendedSeriesEvent);
  }

  FutureOr<void> recommendedMoviesEvent(RecommendedMoviesInitialEvent event,
      Emitter<RecommendedMoviesState> emit) async {
    emit(RecommendedMoviesLoadingState());
    ApiService api = ApiService();
    try {
      var data = await api.getRecommendedMovies(event.id);

      emit(RecommendedMoviesCompletedState(data.results));
    } catch (e) {
      emit(RecommendedMoviesErrorState());
    }
  }

  FutureOr<void> recommendedSeriesEvent(RecommendedSeriesEvent event,
      Emitter<RecommendedMoviesState> emit) async {
    emit(RecommendedMoviesLoadingState());
    ApiService api = ApiService();
    try {
      var data = await api.getRecommendedSeries(event.id);
     
      emit(RecommendedMoviesCompletedState(data.results));
    } catch (e) {
      emit(RecommendedMoviesErrorState());
    }
  }
}
