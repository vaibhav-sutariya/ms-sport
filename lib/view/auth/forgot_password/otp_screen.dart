import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});

  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int secondsRemaining = 90; // 1 minute 30 seconds
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          secondsRemaining = 90; // Restart timer from 1:30
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar(isTrailing: false, icon: Icons.verified_user, text: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
              ),
              const SizedBox(height: 10),

              /// Centering the text using Center Widget and TextAlign.center
              Text(
                'Please check your email \n${widget.email} to see the verification code',
                textAlign: TextAlign.center, // Ensures text is center-aligned
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kWhite,
                ),
              ),

              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'OTP Code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kWhite,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OtpTextField(
                fieldHeight: 56,
                fieldWidth: 60,
                borderRadius: BorderRadius.circular(12),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                numberOfFields: 4,
                showFieldAsBox: true,
                borderWidth: 0,
                fillColor: AppColors.kWhite,
                filled: true,
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.kWhite,
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                text: 'Verify',
                press: () {
                  // showEmailDialog(context);
                },
              ),
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resend code to',
                    style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    formatTime(secondsRemaining),
                    style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
