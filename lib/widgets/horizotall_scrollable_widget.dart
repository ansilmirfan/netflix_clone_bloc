// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/features/detailed_view/ui/detailed_view.dart';

import 'package:netflix_clone_bloc/global_variables/global_variables.dart';

import 'package:netflix_clone_bloc/models.dart/movies_model.dart';

class HorizotallScrollableWidget extends StatelessWidget {
  String heading;
  List<Result> data;
  HorizotallScrollableWidget(
      {super.key, required this.heading, required this.data});

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              heading,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                data.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: deviceHeight * 0.2,
                    width: deviceWidth * 0.3,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailedView(
                                    id: data[index].id,
                                  ),
                                ),
                              );
                            },
                            child: Ink.image(
                                image: NetworkImage(
                                    '$imgUrl${data[index].posterPath}')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
          ),
        ],
      ),
    );
  }
}
