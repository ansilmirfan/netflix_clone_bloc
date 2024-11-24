import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  double height;
  double width;
  bool circle;
  ShimmerWidget(
      {super.key,
      required this.height,
      this.width = double.infinity,
      this.circle = false});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 56, 54, 54),
      highlightColor: const Color.fromARGB(255, 42, 41, 41),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 62, 56, 56),
          borderRadius: BorderRadius.circular(20),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
