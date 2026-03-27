part of '../../feature_imports.dart';

class ShipmentRequestPickupDetailsViewBody extends StatelessWidget {
  const ShipmentRequestPickupDetailsViewBody({
    super.key,
    required this.shipmentModel,
  });
  final ShipmentRequestModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailsHeaderCard(
            shipmentCode: shipmentModel.code ?? '---',
            status: mapStatus(shipmentModel.status),
            originWarehouse: shipmentModel.deliveryBranch ?? '',
            originCountry: 'الصين',
            destinationWarehouse: shipmentModel.receivingBranch ?? '',
            destinationCountry: 'ليبيا',
            date: shipmentModel.createdAt == null
                ? ''
                : formatDateFromApi(shipmentModel.createdAt!),
            shippingType: shipmentModel.shipmentWay?.name ?? '',
            isAir: shipmentModel.shipmentType == "جوي",
          ),
          verticalSpace(AppSizes.h24),
          SectionTitle(
            title: LocaleKeys.shipment_details_shipment_details.tr(),
          ),
          verticalSpace(AppSizes.h20),
          DetailsStatsRow(
            boxesCount: shipmentModel.boxesCount != null
                ? shipmentModel.boxesCount.toString()
                : '0',
            totalVolume: shipmentModel.totalSize != null
                ? shipmentModel.totalSize.toString()
                : '0',
            totalWeight: shipmentModel.totalWeight != null
                ? shipmentModel.totalWeight.toString()
                : '0',
          ),
          verticalSpace(AppSizes.h20),
          DetailsInfoSection(
            trackingCode: shipmentModel.trackingNumber ?? '',
            supplierPhone: shipmentModel.supplierPhone ?? '-',
            classification: shipmentModel.category ?? '-',
            contents: shipmentModel.shipmentContent ?? '-',
          ),
          verticalSpace(AppSizes.h20),
          DetailsInspectionCard(
            isEnabled: shipmentModel.inspectionRequest ?? false,
          ),
          verticalSpace(AppSizes.h16),
          shipmentModel.inspectionNote != null
              ? DetailsNoteCard(note: shipmentModel.inspectionNote ?? "")
              : const SizedBox(),
          SectionTitle(title: LocaleKeys.shipment_details_shipment_photos.tr()),
          verticalSpace(AppSizes.h12),
          shipmentModel.shipmentImages != null &&
                  shipmentModel.shipmentImages!.isNotEmpty
              ? DetailsMediaGrid(
                  items: shipmentModel.shipmentImages!
                      .map(
                        (e) => DetailsMediaItem(
                          url: e,
                          fileName: e.split('/').last,
                          isImage: true,
                        ),
                      )
                      .toList(),
                )
              : Center(
                  child: Text(
                    "لا توجد صور",
                    style: AppTextStyleFactory.create(
                      size: 14,
                      weight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
          verticalSpace(AppSizes.h24),
          SectionTitle(
            title: LocaleKeys.shipment_details_shipment_documents.tr(),
          ),
          verticalSpace(AppSizes.h12),
          shipmentModel.documentImages != null &&
                  shipmentModel.documentImages!.isNotEmpty
              ? DetailsMediaGrid(
                  items: shipmentModel.documentImages!
                      .map(
                        (e) => DetailsMediaItem(
                          url: e,
                          fileName: e.split('/').last,
                          isImage: false,
                        ),
                      )
                      .toList(),
                )
              : Center(
                  child: Text(
                    "لا توجد مستندات",
                    style: AppTextStyleFactory.create(
                      size: 14,
                      weight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
          verticalSpace(AppSizes.h24),
          verticalSpace(AppSizes.h30),
        ],
      ),
    );
  }
}
