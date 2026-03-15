part of '../../feature_imports.dart';

class UploadMediaSection extends StatelessWidget {
  const UploadMediaSection({
    super.key,
    required this.title,
    required this.hint,
    required this.files,
    required this.onTap,
    required this.onRemove,
    this.isPdf = false,
  });

  final String title;
  final String hint;
  final List<File> files;
  final VoidCallback onTap;
  final void Function(int index) onRemove;
  final bool isPdf;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyleFactory.create(
            size: AppSizes.h14,
            weight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h10),
        FileUploadItem(
          text: files.isEmpty ? hint : '${files.length} files selected',
          onTap: onTap,
        ),
        if (files.isNotEmpty) ...[
          verticalSpace(AppSizes.h8),
          Wrap(
            spacing: AppSizes.w8,
            runSpacing: AppSizes.h8,
            children: List.generate(
              files.length,
              (index) => MediaListItem(
                file: files[index],
                isPdf: isPdf,
                onRemove: () => onRemove(index),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
