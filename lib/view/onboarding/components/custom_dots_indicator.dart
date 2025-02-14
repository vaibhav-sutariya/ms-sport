import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int position;
  final int dotsCount;
  final Color color;
  const CustomDotsIndicator({
    required this.dotsCount,
    required this.position,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        color: color,
        size: const Size.square(8.0),
        activeSize: const Size(35, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        activeColor: AppColors.kPrimary,
      ),
    );
  }
}
