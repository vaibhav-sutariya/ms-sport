import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/res/components/custom_text_field.dart';
import 'package:ms_sport/view/auth/forgot_password/otp_screen.dart';
import 'package:ms_sport/view/auth/forgot_password/widgets/dialog_box.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isTrailing: false,
        icon: Icons.arrow_back,
        text: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
              ),
              const SizedBox(height: 10),

              /// Centering the text using Center Widget and TextAlign.center
              Text(
                'Enter your email or mobile \nnumber account to reset your password',
                textAlign: TextAlign.center, // Ensures text is center-aligned
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kWhite,
                ),
              ),

              const SizedBox(height: 30),
              CustomTextField(
                title: 'Email',
                hintText: 'Enter your email or number',
                focusNode: emailFocusNode,
                controller: emailController,
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                text: 'Reset Password',
                press: () {
                  if (emailController.text.isNotEmpty) {
                    showEmailDialog(context);
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                    email: emailController.text,
                                  )));
                    });
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColors.kWhite,
                            title: Column(
                              children: [
                                Icon(Icons.error, color: Colors.red, size: 50),
                                SizedBox(height: 30),
                                Text(
                                  "Please enter your email or phone",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
