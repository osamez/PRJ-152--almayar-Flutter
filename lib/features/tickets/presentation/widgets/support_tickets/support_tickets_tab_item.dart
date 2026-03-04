part of '../../feature_imports.dart';

class SupportTicketsTabItem extends StatelessWidget {
  const SupportTicketsTabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: onTap,
      text: label,
      backgroundColor: isSelected ? AppColors.orange : AppColors.white,
      textColor: isSelected ? AppColors.white : AppColors.darkSlate,
      textStyle: AppTextStyleFactory.create(
        size: AppSizes.h12,
        weight: FontWeight.w700,
        color: isSelected ? AppColors.white : AppColors.darkSlate,
      ),
    );
  }
}
