part of '../../feature_imports.dart';

class ShipmentsTrackingAllShipmentsCard extends StatelessWidget {
  const ShipmentsTrackingAllShipmentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.orange, AppColors.lightOrange],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: CustomInkWellWidget(
        onTap: () => context.push(Routes.shipmentsType),
        radius: AppSizes.radiusMd,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.shipment_tracking_all_shipments.tr(),
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(AppSizes.h12),
            const CustomRounderArrow(
              arrowBackgroundColor: AppColors.white,
              arrowColor: AppColors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
