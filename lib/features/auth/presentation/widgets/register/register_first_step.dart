part of '../../feature_imports.dart';

class RegisterFirstStep extends StatefulWidget {
  const RegisterFirstStep({super.key});

  @override
  State<RegisterFirstStep> createState() => _RegisterFirstStepState();
}

class _RegisterFirstStepState extends State<RegisterFirstStep> {
  late final TextEditingController _nameController;
  late final TextEditingController _countryController;
  late final TextEditingController _cityController;
  late final TextEditingController _regionController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<RegisterCubit>();
    _nameController = TextEditingController(text: cubit.state.fullName);
    _countryController = TextEditingController(text: cubit.state.country);
    _cityController = TextEditingController(text: cubit.state.city);
    _regionController = TextEditingController(text: cubit.state.region);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Column(
      children: [
        AppTextFormField(
          controller: _nameController,
          hintText: LocaleKeys.enter_full_name.tr(),
          onChanged: cubit.updateFullName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_enter_full_name.tr();
            }
            return null;
          },
          title: LocaleKeys.legal_representative_name.tr(),
        ),
        verticalSpace(AppSizes.h16),
        PhoneFormField(
          title: LocaleKeys.legal_representative_phone.tr(),
          hintText: LocaleKeys.phone_hint.tr(),
          // initialValue: cubit.state.phoneNumber,
          onChanged: (phone) => cubit.updatePhoneNumber(phone),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          controller: _countryController,
          hintText: LocaleKeys.select_from_countries.tr(),
          onChanged: cubit.updateCountry,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_select_country.tr();
            }
            return null;
          },
          title: LocaleKeys.country.tr(),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          controller: _cityController,
          hintText: LocaleKeys.select_from_cities.tr(),
          onChanged: cubit.updateCity,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_select_city.tr();
            }
            return null;
          },
          title: LocaleKeys.city.tr(),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          controller: _regionController,
          hintText: LocaleKeys.select_from_regions.tr(),
          onChanged: cubit.updateRegion,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_select_region.tr();
            }
            return null;
          },
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
