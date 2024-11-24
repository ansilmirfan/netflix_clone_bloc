import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_recommended_movies/recommeded_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/home_screen/bloc_movies/movies_bloc.dart';

import 'package:netflix_clone_bloc/features/search_screen/ui/search_screen.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';
import 'package:netflix_clone_bloc/widgets/featured_widget.dart';
import 'package:netflix_clone_bloc/widgets/horizontal_scrollable_widget_shimmer.dart';
import 'package:netflix_clone_bloc/widgets/horizotall_scrollable_widget.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';
import 'package:netflix_clone_bloc/features/home_screen/bloc_featured/featured_series_bloc.dart';
import 'package:netflix_clone_bloc/widgets/custom_tabbar_item.dart';
import 'package:netflix_clone_bloc/widgets/top10_scrollable_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RecommendedMoviesBloc recommendedMoviesBloc = RecommendedMoviesBloc();
    RecommendedMoviesBloc recommendedMoviesBloc2 = RecommendedMoviesBloc();
    RecommendedMoviesBloc recommendedMoviesBloc3 = RecommendedMoviesBloc();
    RecommendedMoviesBloc recommendedMoviesBloc4 = RecommendedMoviesBloc();
    var spacing = const SliverToBoxAdapter(
      child: SizedBox(
        height: 10,
      ),
    );

    recommendedMoviesBloc.add(RecommendedMoviesInitialEvent(14));
    recommendedMoviesBloc2.add(RecommendedMoviesInitialEvent(78));
    recommendedMoviesBloc3.add(RecommendedMoviesInitialEvent(5));
    recommendedMoviesBloc4.add(RecommendedSeriesEvent(10));

    context.read<MoviesBloc>().add(MoviesIntialEvent());
    context.read<FeaturedSeriesBloc>().add(FeaturedSeriesInitialEvent());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildFeaturedWidget(),
          spacing,
          _buildTopRatedMovies(),
          spacing,
          _buildTop10Movies(recommendedMoviesBloc2, true),
          spacing,
          _buildMovies(recommendedMoviesBloc, 'BlockBuster Movies'),
          spacing,
          _buildMovies(recommendedMoviesBloc2, 'Your Next Watch'),
          spacing,
          _buildTop10Movies(recommendedMoviesBloc4, false),
          spacing,
          _buildMovies(recommendedMoviesBloc3, 'Top Searches'),
          spacing,
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildTop10Movies(
      RecommendedMoviesBloc recommendedMoviesBloc2, bool movies) {
    return SliverToBoxAdapter(
      child: BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
        bloc: recommendedMoviesBloc2,
        builder: (context, state) {
          if (state is RecommendedMoviesLoadingState) {
            return const HorizotallScrollableWidgetShimmer();
          }
          if (state is RecommendedMoviesCompletedState) {
            List<Result> data = state.data;
            return Top10ScrollableWidget(
              data: data,
              movies: movies,
            );
          }
          if (state is RecommendedMoviesErrorState) {
            return Center(
              child: Text(errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  SliverToBoxAdapter _buildMovies(
      RecommendedMoviesBloc recommendedMoviesBloc, String title) {
    return SliverToBoxAdapter(
      child: BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
        bloc: recommendedMoviesBloc,
        builder: (context, state) {
          if (state is RecommendedMoviesLoadingState) {
            return const HorizotallScrollableWidgetShimmer();
          } else if (state is RecommendedMoviesCompletedState) {
            return HorizotallScrollableWidget(
              heading: title,
              data: state.data,
            );
          } else if (state is RecommendedMoviesErrorState) {
            return Container(
              alignment: Alignment.center,
              height: deviceHeight * 0.2,
              width: deviceWidth,
              child: Text(errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  SliverToBoxAdapter _buildTopRatedMovies() {
    return SliverToBoxAdapter(
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoadingState) {
            return const HorizotallScrollableWidgetShimmer();
          } else if (state is MoviesCompletedState) {
            return HorizotallScrollableWidget(
              heading: "Top Rated Movies",
              data: state.data,
            );
          } else if (state is MoviesErrorState) {
            return Container(
              alignment: Alignment.center,
              height: deviceHeight * 0.2,
              width: deviceWidth,
              child: Text(errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  SliverToBoxAdapter _buildFeaturedWidget() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: BlocBuilder<FeaturedSeriesBloc, FeaturedSeriesState>(
          builder: (context, state) {
            if (state is FeaturedSeriesLoadingState) {
              return ShimmerWidget(
                height: deviceHeight * 0.6,
              );
            } else if (state is FeaturedSeriesCompletedState) {
              return FeaturedWidget(
                imageUrl: '$imgUrl${state.data.results[0].posterPath}',
                id: state.data.results[0].id,
                genre: List.from(
                    state.data.results[0].genreIds.map((e) => genreMap[e])),
              );
            } else if (state is FeaturedSeiresErrorState) {
              return Container(
                height: deviceHeight * 0.6,
                alignment: Alignment.center,
                child: Text(errorMessage),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black38,
      title: Image.asset(
        'Asset/netflix_icon_n.webp',
        height: 50,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
        ),
        const SizedBox(width: 10),
      ],
      pinned: true,
      expandedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              child: Row(
                children: [
                  CustomTabbarItem(
                    widget: const Text('TV Shows'),
                  ),
                  CustomTabbarItem(
                    widget: const Text('Movies'),
                  ),
                  CustomTabbarItem(
                    widget: const Wrap(
                      children: [
                        Text('Categories'),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
