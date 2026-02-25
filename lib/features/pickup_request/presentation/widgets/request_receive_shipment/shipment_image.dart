part of '../../feature_imports.dart';

class ShipmentImage extends StatelessWidget {
  const ShipmentImage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
          Positioned(
            bottom: AppSizes.h16,
            left: AppSizes.w18,
            right: AppSizes.w18,
            child: Row(
              spacing: AppSizes.w12,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyleFactory.create(
                          size: AppSizes.h16,
                          weight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      verticalSpace(AppSizes.h4),
                      Text(
                        description,
                        style: AppTextStyleFactory.create(
                          size: AppSizes.h12,
                          weight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomRounderArrow(
                  arrowBackgroundColor: AppColors.grey98,
                  arrowColor: AppColors.deepViolet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
