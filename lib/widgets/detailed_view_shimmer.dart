import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';

class DetailedViewShimmer extends StatelessWidget {
  const DetailedViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //---------------image--------------------------
        ShimmerWidget(
          height: deviceHeight * 0.3,
          width: deviceWidth,
        ),
        //-------------------details--------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //---------------title-----------------
              Align(
                alignment: Alignment.topLeft,
                child: ShimmerWidget(
                  height: 15,
                  width: deviceWidth / 2,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              //--------------year and duration--------------
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 10,
                  children: [
                    ShimmerWidget(
                      height: 10,
                      width: deviceWidth * 2 / 3,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ShimmerWidget(
                height: 50,
                width: deviceWidth,
              ),

              const SizedBox(
                height: 10,
              ),
              ShimmerWidget(
                height: 50,
                width: deviceWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              //------------------overview----------------
              Wrap(
                runSpacing: 10,
                children: List.generate(
                  4,
                  (index) => ShimmerWidget(
                    height: 10,
                    width: index == 3 ? deviceWidth / 2 : deviceWidth,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
