part of '../../feature_imports.dart';

class ShipmentDetailsBasicDataTab extends StatelessWidget {
  const ShipmentDetailsBasicDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_basic_data_tab.tr(),
        ),
        verticalSpace(AppSizes.h20),
        const ShipmentDetailsStatsRow(
          boxesCount: '20',
          totalVolume: '20',
          totalWeight: '20',
        ),
        verticalSpace(AppSizes.h30),
        ShipmentDetailsInfoSection(
          rows: [
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_classification_label.tr(),
              value: 'إلكترونيات',
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_contents_label.tr(),
              value: 'هواتف ذكية',
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_tracking_code_label.tr(),
              value: 'JHDF7653829HSH',
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_supplier_phone_label.tr(),
              value: '+218 91 123 4567',
            ),
          ],
        ),
        verticalSpace(AppSizes.h24),
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_photos_title.tr(),
        ),
        verticalSpace(AppSizes.h16),
        const ShipmentDetailsMediaGrid(
          items: [
            ShipmentDetailsMediaItem(fileName: 'Box_Image.jpg', isImage: true),
            ShipmentDetailsMediaItem(fileName: 'Box_Image.jpg', isImage: true),
          ],
        ),
        verticalSpace(AppSizes.h24),
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_documents_title.tr(),
        ),
        verticalSpace(AppSizes.h12),
        const ShipmentDetailsMediaGrid(
          items: [
            ShipmentDetailsMediaItem(fileName: 'Box_Image.jpg', isImage: true),
            ShipmentDetailsMediaItem(fileName: 'Invoice.pdf', isImage: false),
          ],
        ),
      ],
    );
  }
}
