part of '../../feature_imports.dart';

class FileUploadItem extends StatelessWidget {
  const FileUploadItem({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h14,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          border: Border.all(color: AppColors.gray),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.svgUpload,
              width: AppSizes.w20,
              height: AppSizes.h20,
              colorFilter: const ColorFilter.mode(
                AppColors.orange,
                BlendMode.srcIn,
              ),
            ),
            horizontalSpace(AppSizes.w12),
            Expanded(
              child: Text(
                text,
                style: AppTextStyleFactory.create(
                  size: 14,
                  weight: FontWeight.w400,
                  color: AppColors.hintColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
