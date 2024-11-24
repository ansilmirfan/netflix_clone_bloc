import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/features/detailed_view/ui/detailed_view.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';

class RecommendationSearchScreenList extends StatelessWidget {
  List<Result> data;
  RecommendationSearchScreenList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            'Recommended TV Shows&Movies',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ...List.generate(
            data.length,
            (index) => InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailedView(id: data[index].id),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: double.infinity,
                  height: deviceHeight * 0.1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '$imgUrl${data[index].backdropPath}',
                              width: deviceWidth * 0.3,
                              height: deviceHeight * 0.1,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: deviceWidth/2,
                            child: Text(
                              data[index].title,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.play_circle_outline_outlined,
                        size: 35,
                      )
                    ],
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
