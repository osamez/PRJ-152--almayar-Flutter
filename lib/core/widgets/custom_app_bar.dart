import 'package:almeyar/core/utils/exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.offWhite,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(
        title,
        style: AppTextStyleFactory.create(
          size: 20,
          weight: FontWeight.w700,
          color: AppColors.deepViolet,
        ),
      ),
      centerTitle: true,
      leading: Container(
        width: 50.w,
        height: 50.h,
        margin: EdgeInsets.only(
          right: AppSizes.w12,
          top: AppSizes.h10,
          // bottom: AppSizes.h12,
        ),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        ),
        child: CustomInkWellWidget(
          onTap: () => context.pop(),
          radius: AppSizes.radiusSm,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w8,
            vertical: AppSizes.h8,
          ),
          child: SvgPicture.asset(
            AppAssets.svgBackArrow,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
