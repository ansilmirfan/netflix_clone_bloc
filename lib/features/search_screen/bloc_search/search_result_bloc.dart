import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';
import 'package:netflix_clone_bloc/utils/services.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(SearchResultInitial()) {
    on<SearchResultInitilaEvent>((event, emit) {
      emit(SearchResultInitial());
    });
    on<SearchQueryChangedEvent>(searchQueryChangedEvent);
  }

  FutureOr<void> searchQueryChangedEvent(
      SearchQueryChangedEvent event, Emitter<SearchResultState> emit) async {
    emit(SearchResultLoadingstate());
    ApiService apiService = ApiService();
    try {
      var data = await apiService.searchMovies(event.query!);
      if (event.query != null) {
        emit(SearchResultCompletedState(List<Result>.from(data.results)));
      }
    } catch (e) {
      emit(SearchResultErrorState());
    }
  }
}
