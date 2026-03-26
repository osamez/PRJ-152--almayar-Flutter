part of '../../feature_imports.dart';

class RegionDropdown extends StatelessWidget {
  const RegionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.selectedCity != current.selectedCity ||
          previous.selectedRegion != current.selectedRegion,
      builder: (context, state) {
        if (state.selectedCity == null) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(AppSizes.h16),
            RequiredTitle(title: LocaleKeys.region.tr(), isRequired: false),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<RegionModel>(
              items: state.selectedCity?.regions ?? [],
              hintText: LocaleKeys.select_from_regions.tr(),
              itemAsString: (item) => item.name ?? '',
              initialValue: state.selectedRegion,
              onChanged: (region) {
                context.read<RegisterCubit>().selectRegion(region);
              },
              validator: (value) {
                // if (value == null) {
                //   return LocaleKeys.please_select_region.tr();
                // }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
