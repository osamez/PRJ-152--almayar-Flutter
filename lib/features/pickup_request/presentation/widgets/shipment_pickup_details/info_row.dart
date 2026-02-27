part of '../../feature_imports.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

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
              color: AppColors.deepViolet,
            ),
          ),
        ],
      ),
    );
  }
}
