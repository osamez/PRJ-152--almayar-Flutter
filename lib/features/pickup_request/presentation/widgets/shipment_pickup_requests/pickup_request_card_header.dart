part of '../../feature_imports.dart';

class PickupRequestCardHeader extends StatelessWidget {
  const PickupRequestCardHeader({
    super.key,
    required this.status,
    required this.shipmentCode,
    required this.date,
    required this.shippingType,
  });

  final PickupRequestStatus status;
  final String shipmentCode;
  final String date;
  final String shippingType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h12,
      ),
      child: Row(
        children: [
          CustomIconRoundedBox(
            iconPath: AppAssets.svgAirplane,
            width: AppSizes.w48,
            height: AppSizes.w48,
          ),

          horizontalSpace(AppSizes.w12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shipmentCode,
                  style: AppTextStyleFactory.create(
                    size: 16,
                    weight: FontWeight.w700,
                    color: AppColors.darkSlate,
                  ),
                ),
                verticalSpace(AppSizes.h4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSizes.w4,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 16.sp,
                      color: AppColors.deepViolet,
                    ),
                    Text(
                      date,
                      style: AppTextStyleFactory.create(
                        size: 10,
                        weight: FontWeight.w700,
                        color: AppColors.deepViolet,
                      ),
                    ),
                  ],
                ),
                verticalSpace(AppSizes.h4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSizes.w4,
                  children: [
                    SvgPicture.asset(
                      AppAssets.svgAirplane,
                      width: AppSizes.w16,
                      height: AppSizes.h16,
                      colorFilter: const ColorFilter.mode(
                        AppColors.orange,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      shippingType,
                      style: AppTextStyleFactory.create(
                        size: 10,
                        weight: FontWeight.w700,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          PickupRequestStatusBadge(status: status),
        ],
      ),
    );
  }
}
