part of '../../feature_imports.dart';

class ShipmentDetailsBasicDataTab extends StatelessWidget {
  const ShipmentDetailsBasicDataTab({required this.shipment, super.key});
  final ShipmentModel shipment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_basic_data_tab.tr(),
        ),
        verticalSpace(AppSizes.h20),
        ShipmentDetailsStatsRow(
          boxesCount: (shipment.boxesCount ?? 0).toString(),
          totalVolume: (shipment.totalSize ?? 0).toString(),
          totalWeight: (shipment.totalWeight ?? 0).toString(),
        ),
        verticalSpace(AppSizes.h30),
        ShipmentDetailsInfoSection(
          rows: [
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_classification_label.tr(),
              value: shipment.categoryName ?? '',
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_contents_label.tr(),
              value: shipment.contentName ?? '',
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_tracking_code_label.tr(),
              value: shipment.code ?? '-',
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_supplier_phone_label.tr(),
              value: shipment.supplierPhone ?? '-',
            ),
          ],
        ),

        verticalSpace(AppSizes.h24),
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_photos_title.tr(),
        ),
        verticalSpace(AppSizes.h16),
        shipment.shipmentImages != null && shipment.shipmentImages!.isNotEmpty
            ? DetailsMediaGrid(
                items: shipment.shipmentImages!
                    .map(
                      (url) => DetailsMediaItem(
                        url: url,
                        fileName: url.split('/').last,
                        isImage: true,
                      ),
                    )
                    .toList(),
              )
            : Center(
                child: Text(
                  "لا توجد صور",
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
              ),

        verticalSpace(AppSizes.h24),
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_documents_title.tr(),
        ),
        verticalSpace(AppSizes.h12),
        shipment.customsFiles != null && shipment.customsFiles!.isNotEmpty
            ? DetailsMediaGrid(
                items: shipment.customsFiles!
                    .map(
                      (url) => DetailsMediaItem(
                        url: url,
                        fileName: url.split('/').last,
                        isImage: false,
                      ),
                    )
                    .toList(),
              )
            : Center(
                child: Text(
                  "لا توجد مستندات",
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
              ),
      ],
    );
  }
}
