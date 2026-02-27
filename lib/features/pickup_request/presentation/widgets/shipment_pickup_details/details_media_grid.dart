part of '../../feature_imports.dart';

class DetailsMediaItem {
  const DetailsMediaItem({required this.fileName, required this.isImage});

  final String fileName;
  final bool isImage;
}

class DetailsMediaGrid extends StatelessWidget {
  const DetailsMediaGrid({super.key, required this.items});

  final List<DetailsMediaItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.w4,
      children: items.map((item) {
        return Expanded(child: _MediaCard(item: item));
      }).toList(),
    );
  }
}

class _MediaCard extends StatelessWidget {
  const _MediaCard({required this.item});

  final DetailsMediaItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
