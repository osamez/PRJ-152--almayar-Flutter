part of '../../feature_imports.dart';

class RequestItemDetailsSectionTitle extends StatelessWidget {
  const RequestItemDetailsSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyleFactory.create(
        size: 16,
        weight: FontWeight.w700,
        color: AppColors.deepViolet,
      ),
      textAlign: TextAlign.start,
    );
  }
}
