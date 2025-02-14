import 'package:ms_sport/utils/app_assets.dart';

class Onboarding {
  String bgImage;
  String title;
  String info;
  Onboarding({
    required this.bgImage,
    required this.title,
    required this.info,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.kOnboardingFirst,
    title: 'Locate the Destination .',
    info:
        'Your destination is your fingertips. Open app & enter where you want to go ',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingSecond,
    title: 'Locate the Destination .',
    info:
        'Your destination is your fingertips. Open app & enter where you want to go ',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingThird,
    title: 'Locate the Destination .',
    info:
        'Your destination is your fingertips. Open app & enter where you want to go ',
  ),
];
