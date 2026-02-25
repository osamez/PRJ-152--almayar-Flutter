part of '../../feature_imports.dart';

class ShippingTypeSelector extends StatelessWidget {
  const ShippingTypeSelector({
    super.key,
    required this.isExpressSelected,
    required this.onExpressSelected,
    required this.onEconomySelected,
  });

  final bool isExpressSelected;
  final VoidCallback onExpressSelected;
  final VoidCallback onEconomySelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ShippingTypeButton(
            text: LocaleKeys.receive_air_express_shipping.tr(),
            isSelected: isExpressSelected,
            onTap: onExpressSelected,
          ),
        ),
        horizontalSpace(AppSizes.w10),
        Expanded(
          child: _ShippingTypeButton(
            text: LocaleKeys.receive_air_economy_shipping.tr(),
            isSelected: !isExpressSelected,
            onTap: onEconomySelected,
          ),
        ),
      ],
    );
  }
}

class _ShippingTypeButton extends StatelessWidget {
  const _ShippingTypeButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
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
            text,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
