import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';

class GridviewShimmer extends StatelessWidget {
  const GridviewShimmer({super.key});

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
        itemCount: 9,
        itemBuilder: (context, index) => ShimmerWidget(height: 10),
      ),
    );
  }
}
