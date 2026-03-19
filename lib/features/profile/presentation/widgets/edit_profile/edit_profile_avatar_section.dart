part of '../../feature_imports.dart';

class EditProfileAvatarSection extends StatelessWidget {
  final String? imagePath;

  const EditProfileAvatarSection({super.key, this.imagePath});

  Future<void> _showImagePickerModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.h20)),
      ),
      builder: (modalContext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(LocaleKeys.gallery.tr()),
                onTap: () {
                  context.read<UpdateProfileCubit>().pickImage(
                    ImageSourceType.gallery,
                  );
                  Navigator.pop(modalContext);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(LocaleKeys.camera.tr()),
                onTap: () {
                  context.read<UpdateProfileCubit>().pickImage(
                    ImageSourceType.camera,
                  );
                  Navigator.pop(modalContext);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      buildWhen: (previous, current) =>
          previous.selectedImage != current.selectedImage,
      builder: (context, state) {
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
                  ),
                  child: ClipOval(
                    child: state.selectedImage != null
                        ? Image.file(state.selectedImage!, fit: BoxFit.cover)
                        : CustomCachedImage(
                            imageUrl: imagePath,
                            errorWidget: Image.asset(AppAssets.imagesProfile),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: state.selectedImage != null
                        ? () => context.read<UpdateProfileCubit>().removeImage()
                        : () => _showImagePickerModal(context),
                    child: Container(
                      width: AppSizes.w30,
                      height: AppSizes.h30,
                      decoration: BoxDecoration(
                        color: state.selectedImage != null
                            ? AppColors.error500
                            : AppColors.offWhite,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: AppSizes.w2,
                        ),
                      ),
                      child: Icon(
                        state.selectedImage != null ? Icons.close : Icons.edit,
                        size: AppSizes.w16,
                        color: state.selectedImage != null
                            ? AppColors.white
                            : AppColors.deepViolet,
                      ),
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
      },
    );
  }
}
