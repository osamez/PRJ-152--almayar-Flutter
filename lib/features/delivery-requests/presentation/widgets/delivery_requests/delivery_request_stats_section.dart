part of '../../feature_imports.dart';

class DeliveryRequestStatsSection extends StatelessWidget {
  const DeliveryRequestStatsSection({
    super.key,
    required this.boxesCount,
    required this.orderValue,
    required this.deliveryCost,
  });

  final String boxesCount;
  final String orderValue;
  final String deliveryCost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w14,
        vertical: AppSizes.h12,
      ),
      child: Row(
        children: [
          Expanded(
            child: PickupRequestStatItem(
              icon: AppAssets.svgBox,
              label: LocaleKeys.pickup_requests_boxes_count.tr(),
              value: boxesCount,
            ),
          ),
          _buildVerticalDivider(),
          Expanded(
            child: PickupRequestStatItem(
              icon: AppAssets.svgMoney,
              label: LocaleKeys.delivery_requests_order_value.tr(),
              value: orderValue,
            ),
          ),

          _buildVerticalDivider(),

          Expanded(
            child: PickupRequestStatItem(
              icon: AppAssets.svgHand,
              label: LocaleKeys.delivery_requests_delivery_cost.tr(),
              value: deliveryCost,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1.5,
      height: AppSizes.h12,
      color: AppColors.orange,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.w4),
    );
  }
}
