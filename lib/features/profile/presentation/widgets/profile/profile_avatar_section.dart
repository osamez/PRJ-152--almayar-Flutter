part of '../../feature_imports.dart';

class ProfileAvatarSection extends StatelessWidget {
  const ProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
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

            // CircleAvatar(
            //   radius: AppSizes.h42,
            //   backgroundImage: const AssetImage(AppAssets.imagesLogo),
            // ),
            Positioned(
              bottom: -AppSizes.h2,
              right: -AppSizes.w2,
              child: Container(
                width: AppSizes.w16,
                height: AppSizes.h16,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: AppSizes.w2,
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(AppSizes.h14),
        Text(
          'أسامة المرغتي',
          style: AppTextStyleFactory.create(
            size: 18,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h8),
        Text(
          'TIP-2515',
          style: AppTextStyleFactory.create(
            size: 16,
            weight: FontWeight.w700,
            color: AppColors.notActive,
          ),
        ),
      ],
    );
  }
}
