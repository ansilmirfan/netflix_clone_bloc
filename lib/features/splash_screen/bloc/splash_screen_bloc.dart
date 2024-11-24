import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenLoadingInitiateEvent>(splashScreenLoadingInitiateEvent);
  }

  FutureOr<void> splashScreenLoadingInitiateEvent(
      SplashScreenLoadingInitiateEvent event,
      Emitter<SplashScreenState> emit) async {
    emit(SplashLoadingState());
    
    emit(SplashNavigateToHomeState());
  }
}
