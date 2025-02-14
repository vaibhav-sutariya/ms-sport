import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({
    super.key,
    required this.left,
    required this.right,
    required this.isPrice,
  });
  final String left;
  final String right;
  final bool isPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
            color: isPrice ? AppColors.kPrimary : AppColors.kWhite,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          right,
          style: TextStyle(
            color: isPrice ? AppColors.kWhite : AppColors.kPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
