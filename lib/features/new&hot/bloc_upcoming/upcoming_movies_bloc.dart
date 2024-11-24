import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';
import 'package:netflix_clone_bloc/utils/services.dart';
part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesInitialState()) {
    on<UpcomingMoviesIntialEvent>(upcomingMoviesEvent);
    on<TopRatedSeriesEvent>(topRatedSeriesEvent);
  }

  FutureOr<void> upcomingMoviesEvent(
      UpcomingMoviesEvent event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMoviesLoadingState());
    ApiService api = ApiService();

    try {
      var data = await api.getUpcomingMovies();
      emit(UpcomingMoviesCompletedState(data.results));
    } catch (e) {
      emit(UpcomingMoviesErrorState());
    }
  }

  FutureOr<void> topRatedSeriesEvent(
      TopRatedSeriesEvent event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMoviesLoadingState());
    ApiService api = ApiService();

    try {
      var data = await api.getTopRatedTvSeries();
      emit(UpcomingMoviesCompletedState(data.results));
    } catch (e) {
      emit(UpcomingMoviesErrorState());
    }
  }
}
