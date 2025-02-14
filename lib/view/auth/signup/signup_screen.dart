import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/res/components/custom_password_field.dart';
import 'package:ms_sport/res/components/custom_text_field.dart';
import 'package:ms_sport/view/auth/signin/widgets/dont_account_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isTrailing: false, icon: Icons.arrow_back, text: ''),
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
                              'Sign Up now',
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
                              title: 'Name',
                              hintText: 'Enter your name',
                              focusNode: nameFocusNode,
                              controller: nameController,
                            ),
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
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Password must be 8 characters',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.kWhite),
                              ),
                            ),
                            SizedBox(height: 30),
                            CustomElevatedButton(
                              text: 'Sign up',
                              press: () {},
                            ),
                            SizedBox(height: 30),
                            DontAccountText(text: 'Sign in', press: () {}),
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
