part of '../../feature_imports.dart';

class ShoppingSiteCard extends StatelessWidget {
  const ShoppingSiteCard({
    super.key,
    required this.name,
    required this.logoPath,
  });

  final String name;
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                logoPath,
                width: AppSizes.w60,
                height: AppSizes.h60,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        verticalSpace(AppSizes.h8),
        Text(
          name,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w600,
            color: AppColors.darkText,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
