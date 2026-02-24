part of '../../feature_imports.dart';

class ShipmentsAddressesViewBody extends StatelessWidget {
  const ShipmentsAddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AddressesImageCard(),
          verticalSpace(AppSizes.h32),
          const ShipmentAddressesFilters(),
          verticalSpace(AppSizes.h16),
          AppTextFormField(
            hintText: LocaleKeys.shipments_search_country_hint.tr(),
            isRequired: false,
            validator: (p0) {},
            suffixIcon: SvgPicture.asset(
              AppAssets.svgSearch,
            ).withPadding(horizontal: AppSizes.w12, vertical: AppSizes.h12),
            title: LocaleKeys.shipments_search_country_title.tr(),
          ),
          verticalSpace(AppSizes.h16),
          ListView.builder(
            itemBuilder: (context, index) {
              return const ShipmentsAddressListItem(
                arabicName: 'الصين - جوانزو',
                englishName: 'Guangzhou, China',
                flagAsset: AppAssets.svgFlagTest,
              );
            },
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
