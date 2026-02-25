part of '../../feature_imports.dart';

class RequestReceiveShipmentViewBody extends StatelessWidget {
  const RequestReceiveShipmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RequestReceiveShipmentItem(
            imagePath: AppAssets.imagesFlight,
            title: LocaleKeys.request_shipment_air_title.tr(),
            description: LocaleKeys.request_shipment_air_desc.tr(),
            onTap: () {},
            subTitle: LocaleKeys.request_shipment_air_subtitle.tr(),
            prohibitedOnTap: () {},
          ),
          verticalSpace(AppSizes.h32),
          RequestReceiveShipmentItem(
            imagePath: AppAssets.imagesSea,
            title: LocaleKeys.request_shipment_sea_title.tr(),
            description: LocaleKeys.request_shipment_sea_desc.tr(),
            onTap: () {},
            subTitle: LocaleKeys.request_shipment_sea_subtitle.tr(),
            prohibitedOnTap: () {},
          ),
        ],
      ),
    );
  }
}
