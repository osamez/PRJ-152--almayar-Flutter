part of '../../feature_imports.dart';

class ShipmentDetailsLocationLabel extends StatelessWidget {
  const ShipmentDetailsLocationLabel({
    super.key,
    required this.warehouse,
    required this.country,
  });

  final String warehouse;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          warehouse,
          style: AppTextStyleFactory.create(
            size: 10,
            weight: FontWeight.w700,
            color: AppColors.deepViolet,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          country,
          style: AppTextStyleFactory.create(
            size: 9,
            weight: FontWeight.w400,
            color: AppColors.notActive,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
