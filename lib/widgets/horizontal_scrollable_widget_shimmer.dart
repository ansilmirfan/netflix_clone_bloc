import 'package:flutter/material.dart';

import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';

class HorizotallScrollableWidgetShimmer extends StatelessWidget {
  const HorizotallScrollableWidgetShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ShimmerWidget(
              height: 20,
              width: deviceWidth / 2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ShimmerWidget(
                    height: deviceHeight * 0.2,
                    width: deviceWidth * 0.3,
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
