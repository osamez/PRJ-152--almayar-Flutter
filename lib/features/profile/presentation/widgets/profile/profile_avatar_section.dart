part of '../../feature_imports.dart';

class ProfileAvatarSection extends StatelessWidget {
  const ProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.profileState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Skeletonizer(
            enabled: true,
            child: _buildContent(const ProfileModel()),
          ),
          data: (profile) => _buildContent(profile),
          error: (failure) => const ProfileErrorWidget(),
        );
      },
    );
  }

  Column _buildContent(ProfileModel profile) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomCachedImage(
              imageUrl: profile.image ?? '',
              width: AppSizes.w100,
              height: AppSizes.h100,
              radius: AppSizes.h100 / 2,
              fit: BoxFit.cover,
            ),
            // Container(
            //   width: AppSizes.w100,
            //   height: AppSizes.h100,
            //   decoration: const BoxDecoration(
            //     color: AppColors.white,
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(AppAssets.imagesProfile),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
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
          profile.name ?? '',
          style: AppTextStyleFactory.create(
            size: 18,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h8),
        Text(
          profile.code ?? '',
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
