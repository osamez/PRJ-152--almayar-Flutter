part of '../../feature_imports.dart';

class PriceCalculatorShippingMethodToggle extends StatelessWidget {
  const PriceCalculatorShippingMethodToggle({
    super.key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.isPrimarySelected,
    required this.onPrimarySelected,
    required this.onSecondarySelected,
  });

  final String primaryLabel;
  final String secondaryLabel;
  final bool isPrimarySelected;
  final VoidCallback onPrimarySelected;
  final VoidCallback onSecondarySelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _MethodOption(
            label: secondaryLabel,
            isSelected: !isPrimarySelected,
            onTap: onSecondarySelected,
          ),
        ),
        horizontalSpace(AppSizes.w10),
        Expanded(
          child: _MethodOption(
            label: primaryLabel,
            isSelected: isPrimarySelected,
            onTap: onPrimarySelected,
          ),
        ),
      ],
    );
  }
}

class _MethodOption extends StatelessWidget {
  const _MethodOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h12,
          horizontal: AppSizes.w12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange : AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          border: Border.all(
            color: isSelected ? AppColors.orange : AppColors.gray,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyleFactory.create(
              size: AppSizes.h14,
              weight: FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
