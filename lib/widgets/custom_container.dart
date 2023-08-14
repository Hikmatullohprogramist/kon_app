import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  const CustomContainer( {super.key,  required this.width, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: const Color(0xFF394165),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.58),
          borderRadius: BorderRadius.circular(5.76),
        ),
      ),
      child: child,
    );
  }
}
