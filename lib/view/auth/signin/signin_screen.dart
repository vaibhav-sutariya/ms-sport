import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/res/components/custom_password_field.dart';
import 'package:ms_sport/res/components/custom_text_field.dart';
import 'package:ms_sport/view/auth/forgot_password/forgot_password_screen.dart';
import 'package:ms_sport/view/auth/signin/widgets/dont_account_text.dart';
import 'package:ms_sport/view/auth/signup/signup_screen.dart';
import 'package:ms_sport/view/bottom_bar.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryDark,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Sign in now',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kWhite),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Please sign in to continue our app',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kWhite),
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              title: 'Email',
                              hintText: 'Enter your email',
                              focusNode: emailFocusNode,
                              controller: emailController,
                            ),
                            CustomPasswordField(
                              title: 'Password',
                              hintText: 'Enter your password',
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  log('Forgot password pressed');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.kPrimary),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            CustomElevatedButton(
                              text: 'Sign in',
                              press: () {
                                if (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Please fill in all fields'),
                                    ),
                                  );
                                } else {
                                  log('Sign in pressed');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavBar()));
                                }
                              },
                            ),
                            SizedBox(height: 30),
                            DontAccountText(
                              text: 'Sign up',
                              press: () {
                                log('Sign up pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                            ),
                          ],
                        ),

                        // Pushes icons to the bottom
                        Spacer(),

                        // Social Icons Row stays at the bottom
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/logo/facebook.svg',
                              ),
                              SizedBox(width: 20),
                              SvgPicture.asset(
                                'assets/logo/instagram.svg',
                              ),
                              SizedBox(width: 20),
                              SvgPicture.asset(
                                'assets/logo/twitter.svg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
