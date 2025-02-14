import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class DontAccountText extends StatelessWidget {
  const DontAccountText({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?',
            style: TextStyle(
              color: AppColors.kWhite,
              fontWeight: FontWeight.w700,
            )),
        GestureDetector(
          onTap: press,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.kPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
