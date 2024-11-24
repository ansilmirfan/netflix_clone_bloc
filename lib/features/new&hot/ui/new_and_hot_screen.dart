// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_recommended_movies/recommeded_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/new&hot/bloc_upcoming/upcoming_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/search_screen/ui/search_screen.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';
import 'package:netflix_clone_bloc/utils/services.dart';
import 'package:netflix_clone_bloc/widgets/coming_soon_shimmer.dart';
import 'package:netflix_clone_bloc/widgets/coming_soon_widget.dart';

class NewAndHotScreen extends StatefulWidget {
  @override
  _NewAndHotScreenState createState() => _NewAndHotScreenState();
}

class _NewAndHotScreenState extends State<NewAndHotScreen>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    '🍿  Coming soon',
    "🔥 Everyone's Watching",
    '🔟 Top 10 TV Shows',
    '🔟 Top 10 Movies'
  ];

  late TabController _tabController;
  late PageController _pageController;
  late List<ScrollController> _scrollControllers;

  late UpcomingMoviesBloc top10TvSeriesBloc;
  late RecommendedMoviesBloc recommendedMoviesBloc;
  late RecommendedMoviesBloc recommendedMoviesBloc2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController();
    _scrollControllers = List.generate(4, (_) => ScrollController());

    top10TvSeriesBloc = UpcomingMoviesBloc();
    recommendedMoviesBloc = RecommendedMoviesBloc();
    recommendedMoviesBloc2 = RecommendedMoviesBloc();

    top10TvSeriesBloc.add(TopRatedSeriesEvent());
    recommendedMoviesBloc.add(RecommendedMoviesInitialEvent(1255));
    recommendedMoviesBloc2.add(RecommendedMoviesInitialEvent(95));
    for (int i = 0; i < _scrollControllers.length; i++) {
      _scrollControllers[i].addListener(() {
        if (_scrollControllers[i].position.atEdge) {
          if (_scrollControllers[i].position.pixels == 0) {
            if (_tabController.index > 0) {
              _tabController.animateTo(_tabController.index - 1);
            }
          } else {
            if (_tabController.index < _tabController.length - 1) {
              _tabController.animateTo(_tabController.index + 1,
                  curve: Curves.linearToEaseOut);
            }
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<UpcomingMoviesBloc>().add(UpcomingMoviesIntialEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New&Hot'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              ),
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            labelStyle:
                TextStyle(color: primaryBlack, fontWeight: FontWeight.bold),
            unselectedLabelColor: primaryWhite,
            indicator: BoxDecoration(
              color: primaryWhite,
              borderRadius: BorderRadius.circular(40),
            ),
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: primaryWhite),
                ),
                child: Tab(
                  text: tabs[index],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildComingSoonTab(),
            _buildEveryonesWatchingTab(),
            _buildTop10TvShowsTab(),
            _buildTop10MoviesTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoonTab() {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesLoadingState) {
          return ListView.builder(
            controller: _scrollControllers[0],
            itemCount: 3,
            itemBuilder: (context, index) => ComingSoonShimmer(),
          );
        }
        if (state is UpcomingMoviesCompletedState) {
          List<Result> data = state.data;
          return ListView.builder(
            controller: _scrollControllers[0],
            itemCount: state.data.length,
            itemBuilder: (context, index) => ComingSoonWidget(
              monthShort: monthsShort[data[index].releaseDate.month - 1],
              date: data[index].releaseDate.day.toString(),
              backdropPath: '$imgUrl${data[index].backdropPath}',
              genre: data[index].genreIds.map((e) => genreMap[e]).toList(),
              monthLong: monthFull[data[index].releaseDate.month - 1],
              title: data[index].title,
              id: data[index].id,
            ),
          );
        }
        if (state is UpcomingMoviesErrorState) {
          return Center(
            child: Text(errorMessage),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildEveryonesWatchingTab() {
    return BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
      bloc: recommendedMoviesBloc,
      builder: (context, state) {
        if (state is RecommendedMoviesLoadingState) {
          return ListView.builder(
            controller: _scrollControllers[1],
            itemCount: 3,
            itemBuilder: (context, index) => ComingSoonShimmer(
              everyOneWatching: true,
            ),
          );
        }
        if (state is RecommendedMoviesCompletedState) {
          List<Result> data = state.data;
          return ListView.builder(
            controller: _scrollControllers[1],
            itemCount: data.length,
            itemBuilder: (context, index) => ComingSoonWidget(
              backdropPath: '$imgUrl${data[index].backdropPath}',
              genre: data[index].genreIds.map((e) => genreMap[e]).toList(),
              title: data[index].title,
              id: data[index].id,
              overview: data[index].overview,
              everyOnesWatching: true,
            ),
          );
        }
        if (state is RecommendedMoviesErrorState) {
          return Center(
            child: Text(errorMessage),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTop10TvShowsTab() {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      bloc: top10TvSeriesBloc,
      builder: (context, state) {
        if (state is UpcomingMoviesLoadingState) {
          return ListView.builder(
            controller: _scrollControllers[2],
            itemCount: 3,
            itemBuilder: (context, index) => ComingSoonShimmer(),
          );
        }
        if (state is UpcomingMoviesCompletedState) {
          List<Result> data = state.data;
          return ListView.builder(
            controller: _scrollControllers[2],
            itemCount: 10,
            itemBuilder: (context, index) => ComingSoonWidget(
              series: true,
              backdropPath: '$imgUrl${data[index].backdropPath}',
              genre: data[index].genreIds.map((e) => genreMap[e]).toList(),
              title: data[index].title,
              id: data[index].id,
              overview: data[index].overview,
              date: (index + 1).toString(),
              top10: true,
            ),
          );
        }
        if (state is UpcomingMoviesErrorState) {
          return Center(
            child: Text(errorMessage),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTop10MoviesTab() {
    return BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
      bloc: recommendedMoviesBloc2,
      builder: (context, state) {
        if (state is RecommendedMoviesLoadingState) {
          return ListView.builder(
            controller: _scrollControllers[3],
            itemCount: 3,
            itemBuilder: (context, index) => ComingSoonShimmer(),
          );
        }
        if (state is RecommendedMoviesCompletedState) {
          List<Result> data = state.data;
          return ListView.builder(
            controller: _scrollControllers[3],
            itemCount: 10,
            itemBuilder: (context, index) => ComingSoonWidget(
              backdropPath: '$imgUrl${data[index].backdropPath}',
              genre: data[index].genreIds.map((e) => genreMap[e]).toList(),
              title: data[index].title,
              id: data[index].id,
              overview: data[index].overview,
              date: (index + 1).toString(),
              top10: true,
            ),
          );
        }
        if (state is RecommendedMoviesErrorState) {
          return Center(
            child: Text(errorMessage),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
