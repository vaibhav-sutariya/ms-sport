import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ms_sport/res/colors.dart';

void showEmailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Circle Icon
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.kPrimary,
                child: SvgPicture.asset(
                  "assets/logo/Email.svg",
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(height: 16),

              /// Title
              Text(
                "Check your email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              /// Subtitle
              Text(
                "We have sent password\nrecovery instructions to your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
