part of '../../feature_imports.dart';

class RequestItemDetailsBoxesDataTab extends StatelessWidget {
  const RequestItemDetailsBoxesDataTab({super.key, this.order});
  final DeliveryOrderDetailsModel? order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RequestItemDetailsSectionTitle(
          title: LocaleKeys.delivery_request_details_boxes_data_tab.tr(),
        ),
        verticalSpace(AppSizes.h20),
        ...?order?.boxes?.map(
          (box) => Column(
            children: [
              RequestItemDetailsBoxCard(
                statusLabel: box.status?.name ?? '',
                date: box.deliveryDate ?? '',
                shippingType:
                    '', // Update if there's a shipping type field in BoxModel
                totalVolume: '${box.size ?? 0} CMB',
                totalWeight: '${box.weight ?? 0} KG',
                boxCode: box.code ?? '',
                dimensions:
                    '${box.dimensions?.width ?? ''}x${box.dimensions?.height ?? ''}x${box.dimensions?.length ?? ''}',
                shipmentCode: box.shipmentCode ?? '',
                tripCode: box.tripCode ?? '',
                boxPrice: '\$${box.price ?? ''}',
                discount: '', // BoxModel doesn't have a discount field directly
                dueAmount: '\$${box.priceAfterDiscount ?? ''}',
              ),
              verticalSpace(AppSizes.h16),
            ],
          ),
        ),
      ],
    );
  }
}
