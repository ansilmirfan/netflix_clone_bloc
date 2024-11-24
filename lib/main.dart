

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_detailed_movie/detailedmovie_bloc.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_recommended_movies/recommeded_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/home_screen/bloc_featured/featured_series_bloc.dart';
import 'package:netflix_clone_bloc/features/home_screen/bloc_movies/movies_bloc.dart';
import 'package:netflix_clone_bloc/features/new&hot/bloc_upcoming/upcoming_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/search_screen/bloc_search/search_result_bloc.dart';
import 'package:netflix_clone_bloc/features/splash_screen/UI/splash_screen.dart';


void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchResultBloc(),
        ),
        BlocProvider(
          create: (context) => DetailedmovieBloc(),
        ),
        BlocProvider(
          create: (context) => RecommendedMoviesBloc(),
        ),
        BlocProvider(
          create: (context) => UpcomingMoviesBloc(),
        ),
        BlocProvider(
          create: (context) => MoviesBloc(),
        ),
        BlocProvider(
          create: (context) => FeaturedSeriesBloc(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        scrollBehavior: ScrollConfiguration.of(context),
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
              color: Colors.transparent, foregroundColor: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
            titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
            displayLarge: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(surface: Colors.black),
        ),
      ),
    );
  }
}
