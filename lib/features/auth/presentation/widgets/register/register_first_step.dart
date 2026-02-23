part of '../../feature_imports.dart';

class RegisterFirstStep extends StatelessWidget {
  const RegisterFirstStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: LocaleKeys.enter_full_name.tr(),
          validator: (value) {},
          title: LocaleKeys.legal_representative_name.tr(),
        ),
        verticalSpace(AppSizes.h16),
        PhoneFormField(
          title: LocaleKeys.legal_representative_phone.tr(),
          hintText: LocaleKeys.phone_hint.tr(),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: LocaleKeys.select_from_countries.tr(),
          validator: (value) {},
          title: LocaleKeys.country.tr(),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: LocaleKeys.select_from_cities.tr(),
          validator: (value) {},
          title: LocaleKeys.city.tr(),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: LocaleKeys.select_from_regions.tr(),
          validator: (value) {},
          title: LocaleKeys.region.tr(),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
