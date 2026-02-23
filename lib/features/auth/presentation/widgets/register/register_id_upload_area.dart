part of '../../feature_imports.dart';

class RegisterIdUploadArea extends StatelessWidget {
  const RegisterIdUploadArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.pickedImage != current.pickedImage,
      builder: (context, state) {
        return SizedBox(
          height: AppSizes.h177,
          width: double.infinity,
          child: state.pickedImage != null
              ? ImagePreview(
                  image: state.pickedImage!,
                  onRemove: () => context.read<RegisterCubit>().removeImage(),
                )
              : UploadPlaceholder(
                  onTap: () => context.read<RegisterCubit>().pickImage(
                    ImageSourceType.gallery,
                  ),
                ),
        );
      },
    );
  }
}
