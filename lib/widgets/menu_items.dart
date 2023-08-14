import 'package:flutter/material.dart';
import 'package:kon_app/utils/colors.dart';

class MenuItem extends StatelessWidget {
  final String caption;
  final String imgUrl;

  const MenuItem(this.caption, this.imgUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 368,
        height: 54,
        decoration: ShapeDecoration(
          color: AppColor.bottomBarColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.58),
            borderRadius: BorderRadius.circular(5.76),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 54,
              decoration: ShapeDecoration(
                color: const Color(0xFF394165),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.58),
                  borderRadius: BorderRadius.circular(5.76),
                ),
              ),
              child: Image.asset(imgUrl),
            ),
            const SizedBox(width: 14),
            Text(
              caption,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
