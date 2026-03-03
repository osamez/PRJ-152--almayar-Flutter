part of '../../feature_imports.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1,
            blurRadius: AppSizes.h8,
            offset: Offset(0, AppSizes.h2),
          ),
        ],
      ),
      child: CustomInkWellWidget(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h14,
        ),
        onTap: onTap,
        radius: AppSizes.radiusMd,
        child: Row(
          children: [
            CustomIconRoundedBox(
              iconPath: iconPath,
              iconColor: AppColors.orange,
              width: AppSizes.w44,
              height: AppSizes.h44,
              backgroundColor: AppColors.offWhite,
            ),

            horizontalSpace(AppSizes.w10),
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.darkSlate,
              ),
            ),

            const Spacer(),

            const CustomRounderArrow(
              arrowBackgroundColor: AppColors.grey98,
              arrowColor: AppColors.darkSlate,
            ),
          ],
        ),
      ),
    );
  }
}
