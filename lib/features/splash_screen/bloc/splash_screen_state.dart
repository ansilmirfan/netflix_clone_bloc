part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

class SplashLoadingState extends SplashScreenState {}

class SplashNavigateToHomeState extends SplashScreenState {}
