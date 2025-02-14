import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
