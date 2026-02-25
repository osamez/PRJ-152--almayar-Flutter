part of '../../feature_imports.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({
    super.key,
    required this.title,
    required this.hint,
    required this.onTap,
  });

  final String title;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: hint,
      validator: (p0) {},
      title: title,
      suffixIcon: SvgPicture.asset(
        AppAssets.svgPaperclip,
        width: AppSizes.w20,
        height: AppSizes.h20,
      ).withPadding(vertical: AppSizes.h12, horizontal: AppSizes.w12),
    );
  }
}
