import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone_bloc/models.dart/movie_details_model.dart';
import 'package:netflix_clone_bloc/models.dart/tv_seires_details_model.dart';
import 'package:netflix_clone_bloc/utils/services.dart';

part 'detailedmovie_event.dart';
part 'detailedmovie_state.dart';

class DetailedmovieBloc extends Bloc<DetailedmovieEvent, DetailedmovieState> {
  DetailedmovieBloc() : super(DetailedmovieInitial()) {
    on<DetailedMovieInitialEvent>(detailedmovieEvent);
    on<DetailedTvSeriesInitialEvent>(detailedTvSeriesInitialEvent);
  }

  FutureOr<void> detailedmovieEvent(
      DetailedMovieInitialEvent event, Emitter<DetailedmovieState> emit) async {
    int id = event.id;
    emit(DetailedmovieLoadingState());

    ApiService api = ApiService();
    try {
      final data = await api.getDetailsOfMovies(id);
      final youTubeId = await api.getTrailerId(
        id,
      );
      emit(DetailedmovieCompletedState(data, youTubeId.results[0].key));
    } catch (e) {
      emit(DetailedmovieErrorState());
    }
  }

  FutureOr<void> detailedTvSeriesInitialEvent(
      DetailedTvSeriesInitialEvent event,
      Emitter<DetailedmovieState> emit) async {
    emit(DetailedmovieLoadingState());

    ApiService api = ApiService();
    try {
      final data = await api.getDetailsTvSeries(event.id);
      final youTubeId = await api.getTrailerId(event.id, movie: false);
      emit(DetailedSeriesCompletedState(data, youTubeId.results[0].key));
    } catch (e) {
      emit(DetailedmovieErrorState());
    }
  }
}


