part of '../../feature_imports.dart';

class DetailsMediaItem {
  const DetailsMediaItem({
    required this.url,
    required this.fileName,
    required this.isImage,
  });

  final String url;
  final String fileName;
  final bool isImage;
}

class DetailsMediaGrid extends StatelessWidget {
  const DetailsMediaGrid({super.key, required this.items});

  final List<DetailsMediaItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.w12,
        mainAxisSpacing: AppSizes.h12,
        childAspectRatio: 1.1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _MediaCard(item: items[index]);
      },
    );
  }
}

class _MediaCard extends StatelessWidget {
  const _MediaCard({required this.item});

  final DetailsMediaItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.isImage) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Center(
                    child: InteractiveViewer(
                      child: CustomCachedImage(
                        imageUrl: item.url,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSizes.h40,
                    right: AppSizes.w16,
                    child: IconButton(
                      icon: const Icon(Icons.close,
                          color: AppColors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Placeholder for document opening logic
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening file: ${item.fileName}'),
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w8,
          vertical: AppSizes.h8,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: AppSizes.h120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusSm),
                  bottom: Radius.circular(AppSizes.radiusMd),
                ),
              ),
              child: Center(
                child: item.isImage
                    ? Icon(
                        Icons.image_outlined,
                        size: 40,
                        color: AppColors.hintColor.withValues(alpha: 0.5),
                      )
                    : Icon(
                        Icons.picture_as_pdf_outlined,
                        size: 40,
                        color: AppColors.orange.withValues(alpha: 0.7),
                      ),
              ),
            ),
            verticalSpace(AppSizes.h8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.fileName,
                    style: AppTextStyleFactory.create(
                      size: 10,
                      weight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                horizontalSpace(AppSizes.w4),
                Icon(
                  item.isImage
                      ? Icons.visibility_outlined
                      : Icons.download_outlined,
                  size: 18,
                  color: AppColors.deepViolet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
