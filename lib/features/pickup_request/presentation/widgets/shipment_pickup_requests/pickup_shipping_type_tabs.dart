part of '../../feature_imports.dart';

class PickupShippingTypeTabs extends StatefulWidget {
  const PickupShippingTypeTabs({super.key});

  @override
  State<PickupShippingTypeTabs> createState() => _PickupShippingTypeTabsState();
}

class _PickupShippingTypeTabsState extends State<PickupShippingTypeTabs> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.pickup_requests_air_shipping.tr(),
            onPressed: () => setState(() => selectedIndex = 0),
            backgroundColor: selectedIndex == 0
                ? AppColors.orange
                : AppColors.white,
            borderColor: selectedIndex == 0 ? AppColors.orange : AppColors.gray,
            textColor: selectedIndex == 0
                ? AppColors.white
                : AppColors.darkSlate,
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.pickup_requests_sea_shipping.tr(),
            onPressed: () => setState(() => selectedIndex = 1),
            backgroundColor: selectedIndex == 1
                ? AppColors.orange
                : AppColors.white,
            borderColor: selectedIndex == 1 ? AppColors.orange : AppColors.gray,
            textColor: selectedIndex == 1
                ? AppColors.white
                : AppColors.darkSlate,
          ),
        ),
      ],
    );
  }
}
