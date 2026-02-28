part of '../../feature_imports.dart';

class ShipmentDetailsInfoRow extends StatelessWidget {
  const ShipmentDetailsInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.h14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w400,
              color: AppColors.hintColor,
            ),
          ),
          Text(
            value,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w700,
              color: valueColor ?? AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}
