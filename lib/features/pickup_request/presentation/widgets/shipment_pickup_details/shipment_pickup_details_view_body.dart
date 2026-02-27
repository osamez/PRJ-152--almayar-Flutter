part of '../../feature_imports.dart';

class ShipmentPickupDetailsViewBody extends StatelessWidget {
  const ShipmentPickupDetailsViewBody({super.key});

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
          const DetailsHeaderCard(
            shipmentCode: 'RH2053',
            status: PickupRequestStatus.received,
            originWarehouse: 'مخزن جوانزو',
            originCountry: 'الصين',
            destinationWarehouse: 'مخزن طرابلس',
            destinationCountry: 'ليبيا',
            date: '2026-01-01',
            shippingType: 'شحن بحري',
          ),
          verticalSpace(AppSizes.h24),
          SectionTitle(
            title: LocaleKeys.shipment_details_shipment_details.tr(),
          ),
          verticalSpace(AppSizes.h20),
          const DetailsStatsRow(
            boxesCount: '20',
            totalVolume: '20',
            totalWeight: '20',
          ),
          verticalSpace(AppSizes.h20),
          const DetailsInfoSection(
            trackingCode: 'JHDF7653829HSH',
            supplierPhone: '+218 91 123 4567',
            classification: 'إلكترونيات',
            contents: 'هواتف ذكية',
          ),
          verticalSpace(AppSizes.h20),
          const DetailsInspectionCard(isEnabled: true),
          verticalSpace(AppSizes.h12),
          const DetailsNoteCard(
            note:
                'يرجى التأكد من خلو الشاشات من أي كسور وتصوير الرقم التسلسلي لكل جهاز.',
          ),
          verticalSpace(AppSizes.h24),
          SectionTitle(title: LocaleKeys.shipment_details_shipment_photos.tr()),
          verticalSpace(AppSizes.h12),
          const DetailsMediaGrid(
            items: [
              DetailsMediaItem(fileName: 'Box_Image.jpg', isImage: true),
              DetailsMediaItem(fileName: 'Box_Image.jpg', isImage: true),
            ],
          ),
          verticalSpace(AppSizes.h24),
          SectionTitle(
            title: LocaleKeys.shipment_details_shipment_documents.tr(),
          ),
          verticalSpace(AppSizes.h12),
          const DetailsMediaGrid(
            items: [
              DetailsMediaItem(fileName: 'Box_Image.jpg', isImage: true),
              DetailsMediaItem(fileName: 'Invoice.pdf', isImage: false),
            ],
          ),
          verticalSpace(AppSizes.h30),
        ],
      ),
    );
  }
}
