import 'package:almeyar/core/utils/exports.dart';

class DetailsInfoRowData {
  const DetailsInfoRowData({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;
}

class DetailsInfoRow extends StatelessWidget {
  const DetailsInfoRow({
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
          horizontalSpace(AppSizes.w10),
          Flexible(
            child: Text(
              value,
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w700,
                color: valueColor ?? AppColors.darkSlate,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
