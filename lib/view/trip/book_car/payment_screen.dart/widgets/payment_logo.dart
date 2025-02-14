// Widget for Payment Logos
import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class PaymentLogo extends StatelessWidget {
  final String imagePath;
  PaymentLogo(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.kWhite, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
