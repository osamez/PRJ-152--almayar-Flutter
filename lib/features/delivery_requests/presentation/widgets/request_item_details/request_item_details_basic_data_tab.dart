part of '../../feature_imports.dart';

class RequestItemDetailsBasicDataTab extends StatelessWidget {
  const RequestItemDetailsBasicDataTab({super.key, this.order});
  final DeliveryOrderDetailsModel? order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RequestItemDetailsSectionTitle(
          title: LocaleKeys.delivery_request_details_basic_data_title.tr(),
        ),
        verticalSpace(AppSizes.h20),
        RequestItemDetailsInfoSection(
          rows: [
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_order_number.tr(),
              value: order?.code ?? '',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_boxes_count.tr(),
              value:
                  '${order?.boxes?.length ?? 0} ${LocaleKeys.delivery_request_details_box.tr()}',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delegate.tr(),
              value: order?.delegate ?? '',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_order_status.tr(),
              value: order?.status?.name ?? '',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delivery_date.tr(),
              value: order?.deliveryDate ?? '',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_failure_reason.tr(),
              value:
                  order?.failedDeliveryReason ??
                  order?.reasonRefuse ??
                  LocaleKeys.delivery_request_details_no_value.tr(),
              valueColor: AppColors.deepViolet,
            ),
          ],
        ),
      ],
    );
  }
}
