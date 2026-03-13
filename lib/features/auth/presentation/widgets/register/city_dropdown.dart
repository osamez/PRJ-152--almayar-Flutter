part of '../../feature_imports.dart';

class CityDropdown extends StatelessWidget {
  const CityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.selectedCountry != current.selectedCountry ||
          previous.selectedCity != current.selectedCity,
      builder: (context, state) {
        if (state.selectedCountry == null) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(AppSizes.h16),
            Text(
              LocaleKeys.city.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<CityModel>(
              items: state.selectedCountry?.cities ?? [],
              hintText: LocaleKeys.select_from_cities.tr(),
              itemAsString: (item) => item.name ?? '',
              initialValue: state.selectedCity,
              onChanged: (city) {
                context.read<RegisterCubit>().selectCity(city);
              },
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.please_select_city.tr();
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
