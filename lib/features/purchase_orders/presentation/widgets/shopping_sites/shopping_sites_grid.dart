part of '../../feature_imports.dart';

class _ShoppingSiteData {
  const _ShoppingSiteData({required this.name, required this.logo});

  final String name;
  final String logo;
}

const List<_ShoppingSiteData> shoppingSites = [
  _ShoppingSiteData(name: 'Amazon', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Ali Express', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'IHerb', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Trendyol', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Alibaba', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Shein', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Amazon', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Ali Express', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'IHerb', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Trendyol', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Alibaba', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Shein', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Amazon', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'Ali Express', logo: AppAssets.imagesLogo),
  _ShoppingSiteData(name: 'IHerb', logo: AppAssets.imagesLogo),
];

class ShoppingSitesGrid extends StatelessWidget {
  const ShoppingSitesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSizes.w16,
        mainAxisSpacing: AppSizes.h16,
        childAspectRatio: calculateGridChildAspectRatio(
          context: context,
          cardHeight: 126.h,
          spacing: AppSizes.w10,
          crossAxisCount: 3,
          sectionPadding: AppSizes.w20 * 2,
        ),
      ),
      itemCount: shoppingSites.length,
      itemBuilder: (context, index) {
        final site = shoppingSites[index];
        return ShoppingSiteCard(name: site.name, logoPath: site.logo);
      },
    );
  }
}
