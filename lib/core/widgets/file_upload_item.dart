import 'package:almeyar/core/utils/exports.dart';

class FileUploadItem extends StatelessWidget {
  const FileUploadItem({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWellWidget(
      onTap: onTap ?? () {},
      child: Container(
        height: AppSizes.h55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: AppColors.gray),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w15),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: AppTextStyleFactory.create(
                  size: AppSizes.h14,
                  weight: FontWeight.w400,
                  color: AppColors.hintColor,
                ),
              ),
            ),
            SvgPicture.asset(
              AppAssets.svgPaperclip,
              width: AppSizes.w20,
              height: AppSizes.h20,
              colorFilter: const ColorFilter.mode(
                AppColors.hintColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
