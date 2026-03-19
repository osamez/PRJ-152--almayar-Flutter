part of '../../feature_imports.dart';

class ProfileErrorWidget extends StatelessWidget {
  const ProfileErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h12,
      ),
      margin: EdgeInsets.symmetric(horizontal: AppSizes.w20),
      decoration: BoxDecoration(
        color: AppColors.error500.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.w12),
        border: Border.all(color: AppColors.error500.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: AppColors.error500,
            size: AppSizes.w24,
          ),
          horizontalSpace(AppSizes.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.generic_error.tr(),
                  style: AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.error500,
                  ),
                ),
                Text(
                  LocaleKeys.shipment_pickup_requests_retry.tr(),
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w400,
                    color: AppColors.error500.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.read<ProfileCubit>().getProfile(),
            icon: Icon(
              Icons.refresh_rounded,
              color: AppColors.error500,
              size: AppSizes.w20,
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.error500.withOpacity(0.1),

              padding: EdgeInsets.all(AppSizes.w8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
