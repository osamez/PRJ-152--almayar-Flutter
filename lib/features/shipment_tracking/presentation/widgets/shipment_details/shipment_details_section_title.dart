part of '../../feature_imports.dart';

class ShipmentDetailsSectionTitle extends StatelessWidget {
  const ShipmentDetailsSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyleFactory.create(
        size: 16,
        weight: FontWeight.w700,
        color: AppColors.darkText,
      ),
      textAlign: TextAlign.start,
    );
  }
}
