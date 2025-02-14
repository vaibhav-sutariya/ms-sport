import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget({
    super.key,
    required this.left,
    required this.right,
  });
  final String left;
  final String right;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
            color: AppColors.kWhite,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          right,
          style: TextStyle(
            color: AppColors.kPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
