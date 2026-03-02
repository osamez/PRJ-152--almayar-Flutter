part of '../../feature_imports.dart';

class RequestItemDetailsHeader extends StatelessWidget {
  const RequestItemDetailsHeader({super.key, required this.orderNumber});

  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          orderNumber,
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
