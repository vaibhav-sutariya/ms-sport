// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.white,
        backgroundColor: color ?? AppColors.kPrimary,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.kBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
