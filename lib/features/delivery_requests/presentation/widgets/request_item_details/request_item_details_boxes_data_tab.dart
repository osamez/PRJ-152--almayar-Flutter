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
              RequestItemDetailsBoxCard(box: box, order: order!),
              verticalSpace(AppSizes.h16),
            ],
          ),
        ),
      ],
    );
  }
}
