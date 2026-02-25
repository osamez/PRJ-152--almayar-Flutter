part of '../../feature_imports.dart';

class RouteDividerWithIcon extends StatelessWidget {
  const RouteDividerWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 2,
          margin: EdgeInsets.symmetric(horizontal: AppSizes.w4),
          decoration: BoxDecoration(
            color: AppColors.notActive,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        Container(
          width: AppSizes.w34,
          height: AppSizes.h34,
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.orange, width: 1.5),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.svgAirplane,
              width: AppSizes.w16,
              height: AppSizes.h16,
              colorFilter: const ColorFilter.mode(
                AppColors.orange,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
