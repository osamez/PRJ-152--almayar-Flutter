part of '../../feature_imports.dart';

class ShipmentDetailsTabItem extends StatelessWidget {
  const ShipmentDetailsTabItem({
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
      text: label,
      onPressed: onTap,
      backgroundColor: isSelected ? AppColors.orange : AppColors.white,
      textColor: isSelected ? AppColors.white : AppColors.hintColor,
      textStyle: AppTextStyleFactory.create(
        size: AppSizes.h12,
        weight: FontWeight.w600,
        color: isSelected ? AppColors.white : AppColors.hintColor,
      ),
      height: AppSizes.h44,
    );
  }
}
