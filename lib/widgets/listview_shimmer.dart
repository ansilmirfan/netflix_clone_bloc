import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/shimmer_widget.dart';

class ListviewShimmer extends StatelessWidget {
  const ListviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: [
                              ShimmerWidget(
                                height: 20,
                                width: deviceWidth * 8 / 10,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ...List.generate(
                                8,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: deviceHeight * 0.1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: ShimmerWidget(
                                                height: deviceHeight * 0.1,
                                                width: deviceWidth * 0.3,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            ShimmerWidget(
                                              height: 20,
                                              width: deviceWidth / 2,
                                            ),
                                          ],
                                        ),
                                        ShimmerWidget(
                                          height: 40,
                                          width: 40,
                                          circle: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
  }
}
