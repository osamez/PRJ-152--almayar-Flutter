part of '../../feature_imports.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.getLocationsState != current.getLocationsState ||
          previous.selectedCountry != current.selectedCountry,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.country.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<CountryLocationModel>(
              items: state.getLocationsState.valueOrNull ?? [],
              hintText: LocaleKeys.select_from_countries.tr(),
              itemAsString: (item) => item.name ?? '',
              initialValue: state.selectedCountry,
              onChanged: (country) {
                context.read<RegisterCubit>().selectCountry(country);
              },
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.please_select_country.tr();
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
