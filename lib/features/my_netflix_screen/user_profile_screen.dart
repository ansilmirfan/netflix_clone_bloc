import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/features/detailed_view/bloc_recommended_movies/recommeded_movies_bloc.dart';
import 'package:netflix_clone_bloc/features/search_screen/ui/search_screen.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/horizontal_scrollable_widget_shimmer.dart';
import 'package:netflix_clone_bloc/widgets/horizotall_scrollable_widget.dart';

class UserProfileScreen extends StatelessWidget {
  void Function(int) onTabChange;
  UserProfileScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    RecommendedMoviesBloc recommendedMoviesBloc = RecommendedMoviesBloc();
    recommendedMoviesBloc.add(RecommendedMoviesInitialEvent(78));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Netflix',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ));
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.menu_rounded),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'Asset/netflix user.jpg',
            height: 70,
          ),
          Center(
            child: Text(
              'ansilmirfan123',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildAddToMyListWidget(context),
          const SizedBox(
            height: 10,
          ),
          _buildTrailersYouHaveWatchedWidget(context, recommendedMoviesBloc),
          _buildHistoryWidget(context)
        ],
      ),
    );
  }

  BlocBuilder _buildTrailersYouHaveWatchedWidget(
      BuildContext context, RecommendedMoviesBloc recommendedMoviesBloc) {
    return BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
      bloc: recommendedMoviesBloc,
      builder: (context, state) {
        if (state is RecommendedMoviesLoadingState) {
          return const HorizotallScrollableWidgetShimmer();
        } else if (state is RecommendedMoviesCompletedState) {
          return HorizotallScrollableWidget(
            heading: 'Trailers You Have Watched',
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
    );
  }

  Container _buildAddToMyListWidget(BuildContext context) {
    return Container(
      height: deviceHeight * 0.2,
      width: deviceWidth * 0.8,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 36, 36),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('Asset/treasure.jpg'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add to My List',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Keep track if the TV shows and movies you want to watch',
                    style: TextStyle(color: primaryGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {
                        onTabChange(0);
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 72, 71, 71),
                        ),
                      ),
                      child: Text(
                        'Browse to Add to My List',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildHistoryWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          'Asset/binacular.jpg',
          width: 170,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'My Netflix',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Come back to see your watch history,ratings and more.This section gets better the more you use Netflix',
          style: TextStyle(color: primaryGrey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            onTabChange(3);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Color.fromARGB(255, 72, 71, 71),
            ),
          ),
          child: Text(
            'Browse TV Shows & Movies',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
