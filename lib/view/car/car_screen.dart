import 'package:flutter/material.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar(isTrailing: false, icon: Icons.car_rental, text: 'Car'),
    );
  }
}
