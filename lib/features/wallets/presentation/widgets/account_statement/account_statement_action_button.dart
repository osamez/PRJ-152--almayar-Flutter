part of '../../feature_imports.dart';

class AccountStatementActionButton extends StatelessWidget {
  const AccountStatementActionButton({
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
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1,
            blurRadius: AppSizes.h8,
            offset: Offset(0, AppSizes.h2),
          ),
        ],
      ),
      child: CustomInkWellWidget(
        onTap: onTap,
        radius: AppSizes.radiusMd,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconRoundedBox(
              iconPath: iconPath,
              iconColor: AppColors.deepViolet,
              backgroundColor: AppColors.offWhite,
              width: AppSizes.w44,
              height: AppSizes.h44,
              iconWidth: AppSizes.w32,
              iconHeight: AppSizes.h32,
            ),
            verticalSpace(AppSizes.h10),
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.darkText,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
