part of '../../feature_imports.dart';

class ShoppingSiteCard extends StatelessWidget {
  const ShoppingSiteCard({super.key, required this.shoppingSite});

  final ShoppingSiteModel shoppingSite;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: CustomInkWellWidget(
        onTap: () {
          if (shoppingSite.url != null) {
            openUrlInBrowser(shoppingSite.url!, context);
          }
        },
        radius: AppSizes.radiusLg,
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomCachedImage(
                    imageUrl: shoppingSite.image ?? '',
                    width: AppSizes.w60,
                    height: AppSizes.h60,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            verticalSpace(AppSizes.h8),
            Text(
              shoppingSite.name ?? '',
              style: AppTextStyleFactory.create(
                size: 12,
                weight: FontWeight.w600,
                color: AppColors.darkText,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openUrlInBrowser(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        AppLogger.error('مش قادر أفتح اللينك ده: $urlString');
      }
    } catch (e) {
      AppLogger.error('حدث خطأ أثناء فتح الرابط: $e');
      if (context.mounted) {
        showAppSnackbar(
          context: context,
          type: SnackbarType.error,
          description: 'حدث خطأ أثناء فتح الرابط',
        );
      }
    }
  }
}
