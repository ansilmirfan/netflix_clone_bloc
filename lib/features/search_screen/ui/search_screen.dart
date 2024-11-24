import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_recommended_movies/recommeded_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/home_screen/bloc_featured/featured_series_bloc.dart';
import 'package:netflix_clone_bloc/features/search_screen/bloc_search/search_result_bloc.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/utils/debouncer.dart';
import 'package:netflix_clone_bloc/widgets/gridview_details_search.dart';
import 'package:netflix_clone_bloc/widgets/gridview_shimmer.dart';
import 'package:netflix_clone_bloc/widgets/listview_shimmer.dart';
import 'package:netflix_clone_bloc/widgets/recommendation_search_screen.dart';



class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  Debouncer delay = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    
    context
        .read<RecommendedMoviesBloc>()
        .add(RecommendedMoviesInitialEvent(95));
    context.read<FeaturedSeriesBloc>().add(FeaturedSeriesInitialEvent());
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            style: TextStyle(color: primaryWhite),
            onChanged: (value) {
              if (value.isNotEmpty && value.length >= 1) {
                delay.run(() {
                  BlocProvider.of<SearchResultBloc>(context)
                      .add(SearchQueryChangedEvent(value));
                });
              } else {
                BlocProvider.of<SearchResultBloc>(context)
                    .add(SearchResultInitilaEvent());
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: primaryWhite,
              ),
              suffixIcon: Icon(
                Icons.mic,
                color: primaryWhite,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: const Color.fromARGB(255, 42, 42, 42),
              hintText: 'Search shows, movies....',
              hintStyle: TextStyle(color: primaryGrey),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchResultBloc, SearchResultState>(
              builder: (context, state) {
                if (controller.text.isEmpty || controller.text.length == 0) {
                  return BlocBuilder<RecommendedMoviesBloc,
                      RecommendedMoviesState>(
                    builder: (context, recommendedState) {
                      if (recommendedState is RecommendedMoviesLoadingState) {
                        return const ListviewShimmer();
                      } else if (recommendedState
                          is RecommendedMoviesCompletedState) {
                        return RecommendationSearchScreenList(
                          data: recommendedState.data,
                        );
                      } else if (recommendedState
                          is RecommendedMoviesErrorState) {
                        return Center(
                          child: Text(errorMessage),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
                } else {
                  if (state is SearchResultLoadingstate) {
                    return const GridviewShimmer();
                  } else if (state is SearchResultCompletedState) {
                    if (state.data.isEmpty) {
                      return const Center(
                        child: Text(
                          "Oops We haven't got that. Try searching for another movie.",textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return GridviewDetailsSearch(data: state.data);
                    }
                  } else if (state is SearchResultErrorState) {
                    return Center(
                      child: Text(errorMessage),
                    );
                  } else {
                    return const SizedBox.shrink()
                    ;
                  }
                }
              },
            ),             
            
          ),
        ],
      ),
    );
  }
}
