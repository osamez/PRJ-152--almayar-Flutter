part of '../../feature_imports.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key, required this.image, required this.onRemove});

  final File image;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(
          image,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ).clipRRect(all: AppSizes.radiusXxs),
        Positioned(
          bottom: AppSizes.h8,
          left: AppSizes.w8,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              width: AppSizes.w40,
              height: AppSizes.h40,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w8,
                vertical: AppSizes.h8,
              ),
              decoration: const BoxDecoration(
                color: Color(0xffF8E8E8),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppAssets.svgTrashDuotone,
                width: AppSizes.w20,
                height: AppSizes.h20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
