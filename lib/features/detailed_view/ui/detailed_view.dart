import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_detailed_movie/detailedmovie_bloc.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_recommended_movies/recommeded_movies_bloc.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/detailed_view_shimmer.dart';
import 'package:netflix_clone_bloc/widgets/details_widget.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';

class DetailedView extends StatelessWidget {
  int id;
  bool tvSeries;
  DetailedView({super.key, required this.id, this.tvSeries = false});

  @override
  Widget build(BuildContext context) {
    context.read<DetailedmovieBloc>().add(tvSeries
        ? DetailedTvSeriesInitialEvent(id)
        : DetailedMovieInitialEvent(id));
    context.read<RecommendedMoviesBloc>().add(tvSeries
        ? RecommendedSeriesEvent(id)
        : RecommendedMoviesInitialEvent(id));
    return Scaffold(
      
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-------------------movie details------------------
            BlocBuilder<DetailedmovieBloc, DetailedmovieState>(
              builder: (context, state) {
                if (state is DetailedmovieLoadingState) {
                  return const DetailedViewShimmer();
                } else if (state is DetailedmovieCompletedState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DetailsWidget(
                        youTubeId: state.youtubeId,
                        imagePath: '$imgUrl${state.data.backdropPath}',
                        overview: state.data.overview,
                        releasedYear: state.data.releaseDate.year.toString(),
                        runtimeOrSeason: minutesToHour(state.data.runtime),
                        title: state.data.title,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                } else if (state is DetailedSeriesCompletedState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DetailsWidget(
                        youTubeId: state.youtubeId,
                        series: true,
                        imagePath: '$imgUrl${state.data.backdropPath}',

                        overview: state.data.overview,
                        releasedYear: state.data.firstAirDate.year.toString(),
                        runtimeOrSeason: state.data.numberOfSeasons.toString(),
                        title: state.data.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                } else if (state is DetailedmovieErrorState) {
                  return SizedBox(
                    height: deviceHeight * 0.25,
                    child: const Center(
                      child: Text('Network Error Please check the Internet'),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Stack(
              children: [
                Divider(
                  thickness: 2,
                  color: primaryGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 140,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 229, 21, 6),
                            width: 5,
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text('More Like This'),
                    ),
                  ),
                ),
              ],
            ),

            //--------------------recommende movies----------------------
            BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
              builder: (context, state) {
                if (state is RecommendedMoviesLoadingState) {
                  return Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(
                      6,
                      (index) => ShimmerWidget(
                        height: deviceHeight * .2,
                        width: deviceWidth * 0.3,
                      ),
                    ),
                  );
                }
                if (state is RecommendedMoviesCompletedState) {
                  return Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(
                      state.data.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailedView(
                              id: state.data[index].id,
                              tvSeries: tvSeries,
                            ),
                          ));
                        },
                        child: SizedBox(
                          height: deviceHeight * .2,
                          width: deviceWidth * 0.3,
                          child: Stack(
                            children: [
                              Ink.image(
                                height: deviceHeight * .2,
                                width: deviceWidth * 0.3,
                                image: NetworkImage(
                                    '$imgUrl${state.data[index].posterPath}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    'Asset/netflix_icon_n.webp',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                if (state is RecommendedMoviesErrorState) {
                  return SizedBox(
                    height: deviceHeight * .2,
                    child: const Center(
                      child: Text('Network Error please Check the internet'),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
