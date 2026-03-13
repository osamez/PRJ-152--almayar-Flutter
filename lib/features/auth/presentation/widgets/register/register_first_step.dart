part of '../../feature_imports.dart';

class RegisterFirstStep extends StatefulWidget {
  const RegisterFirstStep({super.key});

  @override
  State<RegisterFirstStep> createState() => _RegisterFirstStepState();
}

class _RegisterFirstStepState extends State<RegisterFirstStep> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<RegisterCubit>();
    _nameController = TextEditingController(text: cubit.state.fullName);
  }

  @override
  void dispose() {
    _nameController.dispose();
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
          onChanged: (phone) => cubit.updatePhoneNumber(phone),
          onCountryChanged: (code) => cubit.updatePhoneKey(code),
        ),
        verticalSpace(AppSizes.h16),
        const CountryDropdown(),
        const CityDropdown(),
        const RegionDropdown(),
      ],
    );
  }
}
