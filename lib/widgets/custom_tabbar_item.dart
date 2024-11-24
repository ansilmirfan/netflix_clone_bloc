import 'package:flutter/material.dart';

class CustomTabbarItem extends StatelessWidget {
  Widget? widget;
CustomTabbarItem({super.key,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white,style: BorderStyle.solid),
      ),
      child: widget,
    );
  }
}
