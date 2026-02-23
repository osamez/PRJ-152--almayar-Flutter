import 'package:almeyar/generated/locale_keys.g.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;

  OnBoardingModel({required this.title, required this.subTitle});
}

final List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: LocaleKeys.onboarding_title_1,
    subTitle: LocaleKeys.onboarding_subtitle_1,
  ),
  OnBoardingModel(
    title: LocaleKeys.onboarding_title_2,
    subTitle: LocaleKeys.onboarding_subtitle_2,
  ),
  OnBoardingModel(
    title: LocaleKeys.onboarding_title_3,
    subTitle: LocaleKeys.onboarding_subtitle_3,
  ),
];
