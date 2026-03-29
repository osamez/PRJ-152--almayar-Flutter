part of '../../feature_imports.dart';

class PurchaseOrderStatsSection extends StatelessWidget {
  const PurchaseOrderStatsSection({
    super.key,
    required this.orderValue,
    required this.amountPaid,
    required this.website,
  });

  final String orderValue;
  final String amountPaid;
  final String website;

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
            child: _StatItem(
              icon: AppAssets.svgInvoice,
              label: LocaleKeys.purchase_orders_order_value.tr(),
              value: orderValue,
            ),
          ),

          _buildVerticalDivider(),
          Expanded(
            child: _StatItem(
              icon: AppAssets.svgHand,
              label: LocaleKeys.purchase_orders_amount_paid.tr(),
              value: amountPaid,
            ),
          ),
          _buildVerticalDivider(),
          Expanded(
            child: _StatItem(
              icon: AppAssets.svgGlobel,
              label: LocaleKeys.purchase_orders_website.tr(),
              value: website,
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

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: AppSizes.w18,
          height: AppSizes.h18,
          colorFilter: const ColorFilter.mode(
            AppColors.deepViolet,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyleFactory.create(
                  size: 11,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                style: AppTextStyleFactory.create(
                  size: 11,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
