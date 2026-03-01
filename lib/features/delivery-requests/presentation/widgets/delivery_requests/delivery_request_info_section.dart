part of '../../feature_imports.dart';

class DeliveryRequestInfoSection extends StatelessWidget {
  const DeliveryRequestInfoSection({
    super.key,
    required this.address,
    required this.branch,
    required this.deliveryDate,
  });

  final String address;
  final String branch;
  final String deliveryDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w14,
        vertical: AppSizes.h12,
      ),
      child: Column(
        children: [
          DeliveryRequestInfoRow(
            icon: AppAssets.svgMapPinArea,
            label: LocaleKeys.delivery_requests_address.tr(),
            value: address,
          ),
          verticalSpace(AppSizes.h8),
          DeliveryRequestInfoRow(
            icon: AppAssets.svgMapPinArea,
            label: LocaleKeys.delivery_requests_delivery_branch.tr(),
            value: branch,
          ),
          verticalSpace(AppSizes.h8),
          DeliveryRequestInfoRow(
            icon: AppAssets.svgCalendar,
            label: LocaleKeys.delivery_requests_delivery_date.tr(),
            value: deliveryDate,
          ),
        ],
      ),
    );
  }
}
