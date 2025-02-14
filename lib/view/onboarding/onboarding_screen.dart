import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/auth/signin/signin_screen.dart';
import 'package:ms_sport/view/onboarding/components/custom_dots_indicator.dart';
import 'package:ms_sport/view/onboarding/components/custom_gradient_card.dart';
import 'package:ms_sport/view/onboarding/components/onboarding_card.dart';
import 'package:ms_sport/view/onboarding/components/primary_button.dart';
import 'package:ms_sport/view/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onboardingList[_currentIndex].bgImage),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: CustomGradientCard(
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingList.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return OnboardingCard(
                          onboarding: onboardingList[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomDotsIndicator(
                    dotsCount: onboardingList.length,
                    position: _currentIndex,
                    color: AppColors.kWhite,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    onTap: () async {
                      if (_currentIndex == onboardingList.length - 1) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('onboarding_completed', true);
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SignInScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    text: _currentIndex == onboardingList.length - 1
                        ? 'Next'
                        : 'Get Started',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                _pageController.jumpToPage(onboardingList.length - 1);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFCAEAFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
