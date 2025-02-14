import 'package:flutter/material.dart';

class CustomGradientCard extends StatelessWidget {
  final Widget child;
  const CustomGradientCard({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(),
      child: child,
    );
  }
}
