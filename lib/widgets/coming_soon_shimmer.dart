import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';

class ComingSoonShimmer extends StatelessWidget {
  bool everyOneWatching;
  ComingSoonShimmer({super.key, this.everyOneWatching = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: deviceHeight * 0.40,
      width: double.infinity,
      child: Row(
        children: [
          Visibility(
            visible:! everyOneWatching,
            child: Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: ShimmerWidget(
                  height: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerWidget(height: deviceHeight * .25),
                const SizedBox(
                  height: 10,
                ),
                Align(child: ShimmerWidget(height: 30)),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ShimmerWidget(
                    height: 30,
                    width: deviceWidth / 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ShimmerWidget(
                    height: 20,
                    width: deviceWidth * 6 / 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
