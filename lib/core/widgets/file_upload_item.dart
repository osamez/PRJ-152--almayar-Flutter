import 'package:almeyar/core/utils/exports.dart';

class FileUploadItem extends StatelessWidget {
  const FileUploadItem({
    super.key,
    required this.text,
    this.onTap,
    required this.title,
  });

  final String text;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyleFactory.create(
            size: AppSizes.h14,
            weight: FontWeight.w500,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h8),
        CustomInkWellWidget(
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
        ),
      ],
    );
  }
}
