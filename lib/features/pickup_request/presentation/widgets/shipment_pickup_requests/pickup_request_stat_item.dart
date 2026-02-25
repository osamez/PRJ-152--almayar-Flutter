part of '../../feature_imports.dart';

class PickupRequestStatItem extends StatelessWidget {
  const PickupRequestStatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: AppSizes.w16,
          height: AppSizes.h16,
          colorFilter: const ColorFilter.mode(
            AppColors.deepViolet,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 10,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            Text(
              value,
              style: AppTextStyleFactory.create(
                size: 10,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PickupRequestStatsDivider extends StatelessWidget {
  const PickupRequestStatsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '|',
      style: AppTextStyleFactory.create(
        size: AppSizes.h16,
        weight: FontWeight.w700,
        color: AppColors.orange,
      ),
    );
  }
}
