import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/features/detailed_view/ui/detailed_view.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';

class GridviewDetailsSearch extends StatelessWidget {
  List<Result> data;
  GridviewDetailsSearch({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemCount: data.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailedView(id: data[index].id),
            ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Ink.image(
                image: data[index].posterPath.isNotEmpty
                    ? NetworkImage('$imgUrl${data[index].posterPath}')
                    : const AssetImage('Asset/netflix_icon_n.webp')),
          ),
        ),
      ),
    );
  }
}
