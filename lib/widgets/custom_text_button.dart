import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  double? height;
  double? width;
  Color bgColor;
  Color splashColor;
  double? splashRadius;
  Widget? child;
  CustomTextButton(
      {super.key,
      required this.bgColor,
      this.child,
      this.width,
      this.height,
      this.splashRadius,
      this.splashColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: splashColor,
   
      radius: splashRadius,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        color: bgColor,
        child: child,
      ),
    );
  }
}
