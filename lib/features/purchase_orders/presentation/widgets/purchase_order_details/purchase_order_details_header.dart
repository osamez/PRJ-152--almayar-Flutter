part of '../../feature_imports.dart';

class PurchaseOrderDetailsHeader extends StatelessWidget {
  const PurchaseOrderDetailsHeader({super.key, required this.orderCode});

  final String orderCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          orderCode,
          style: AppTextStyleFactory.create(
            size: AppSizes.h24,
            weight: FontWeight.w700,
            color: AppColors.deepViolet,
          ),
        ),
        const Spacer(),
        CustomRounderArrow(
          arrowBackgroundColor: AppColors.grey97,
          arrowColor: AppColors.deepViolet,
          width: AppSizes.w44,
          height: AppSizes.h44,
        ),
      ],
    );
  }
}
