import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';

import 'package:netflix_clone_bloc/utils/services.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitialState()) {
    on<MoviesIntialEvent>(moviesEvent);
  }

  FutureOr<void> moviesEvent(
      MoviesEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoadingState());
    ApiService api = ApiService();
    try {
      final data = await api.getTopRatedMovies();
      emit(MoviesCompletedState(data.results));
    } catch (e) {
      emit(MoviesErrorState());
    }
  }
}
