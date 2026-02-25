part of '../../feature_imports.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyleFactory.create(
        size: 14,
        weight: FontWeight.w600,
        color: AppColors.deepViolet,
      ),
    );
  }
}
