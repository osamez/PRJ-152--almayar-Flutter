part of '../../feature_imports.dart';

class EditProfileAvatarSection extends StatelessWidget {
  const EditProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: AppSizes.w100,
              height: AppSizes.h100,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAssets.imagesProfile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: AppSizes.w30,
                height: AppSizes.h30,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: AppSizes.w2,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  size: AppSizes.w16,
                  color: AppColors.deepViolet,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(AppSizes.h12),
        Text(
          LocaleKeys.edit_profile_change_photo.tr(),
          style: AppTextStyleFactory.create(
            size: 18,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}
