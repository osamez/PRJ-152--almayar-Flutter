part of '../../feature_imports.dart';

class DeliveryTypeTabs extends StatefulWidget {
  const DeliveryTypeTabs({super.key});

  @override
  State<DeliveryTypeTabs> createState() => _DeliveryTypeTabsState();
}

class _DeliveryTypeTabsState extends State<DeliveryTypeTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.delivery_requests_personal_pickup.tr(),
            onPressed: () => setState(() => selectedIndex = 0),
            backgroundColor: selectedIndex == 0
                ? AppColors.orange
                : AppColors.white,
            textColor: selectedIndex == 0
                ? AppColors.white
                : AppColors.darkSlate,
          ),
        ),
        horizontalSpace(AppSizes.w10),
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.delivery_requests_delivery_service.tr(),
            onPressed: () => setState(() => selectedIndex = 1),
            backgroundColor: selectedIndex == 1
                ? AppColors.orange
                : AppColors.white,
            textColor: selectedIndex == 1
                ? AppColors.white
                : AppColors.darkSlate,
          ),
        ),
      ],
    );
  }
}
