import 'dart:io';

import 'package:almeyar/core/utils/exports.dart';

class MediaListItem extends StatelessWidget {
  const MediaListItem({
    super.key,
    required this.file,
    required this.onRemove,
    this.isPdf = false,
  });

  final File file;
  final VoidCallback onRemove;
  final bool isPdf;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: AppSizes.w80,
          height: AppSizes.h80,
          padding: isPdf ? EdgeInsets.all(AppSizes.w8) : null,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            border: Border.all(color: AppColors.gray),
            image: !isPdf
                ? DecorationImage(image: FileImage(file), fit: BoxFit.cover)
                : null,
          ),
          child: isPdf
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                      size: 30,
                    ),
                    verticalSpace(AppSizes.h4),
                    Text(
                      file.path.split('/').last,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyleFactory.create(
                        size: AppSizes.sp8,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              : null,
        ),
        Positioned(
          top: -2,
          right: -2,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
