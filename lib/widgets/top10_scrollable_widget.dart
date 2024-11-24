import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/features/detailed_view/ui/detailed_view.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';

class Top10ScrollableWidget extends StatelessWidget {
  final bool movies;
  final List<Result> data;

  const Top10ScrollableWidget({super.key, required this.data, this.movies = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * .3,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              movies
                  ? 'Top 10 Movies in India Today'
                  : 'Top 10 TV Shows in India Today',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SizedBox(
                    width: deviceWidth / 2.1,
                    height: deviceHeight * .20,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -28,
                          left: (index == 9) ? 10 : 35,
                          child: BorderedText(
                            strokeWidth: 2,
                            strokeColor: primaryWhite,
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                letterSpacing: -35,
                                color: primaryBlack,
                                fontSize: (deviceHeight * .30) / 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailedView(
                                  id: data[index].id,
                                  tvSeries: !movies,
                                ),
                              ));
                            },
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: deviceWidth / 3 - 10,
                                  maxHeight: deviceHeight * .23,
                                ),
                                child: 
                                // Container(
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(5),
                                //     image: DecorationImage(
                                //       fit: BoxFit.fill,
                                //       image: NetworkImage(
                                //           '$imgUrl${data[index].posterPath}'),
                                //     ),
                                //   ),
                                // )
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Ink.image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        '$imgUrl${data[index].posterPath}'),
                                  ),
                                ),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, top: 15),
                          child: Image.asset(
                            'Asset/netflix_icon_n.webp',
                            height: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
