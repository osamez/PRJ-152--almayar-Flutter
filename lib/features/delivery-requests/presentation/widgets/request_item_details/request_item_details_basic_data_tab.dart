part of '../../feature_imports.dart';

class RequestItemDetailsBasicDataTab extends StatelessWidget {
  const RequestItemDetailsBasicDataTab({super.key});

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
              value: '31493548089',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_boxes_count.tr(),
              value: '86 ${LocaleKeys.delivery_request_details_box.tr()}',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delegate.tr(),
              value: 'أسامة المرغني',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_order_status.tr(),
              value: LocaleKeys.delivery_requests_delivering.tr(),
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delivery_date.tr(),
              value: 'م 05:01 2026-01-29',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_failure_reason.tr(),
              value: LocaleKeys.delivery_request_details_no_value.tr(),
              valueColor: AppColors.deepViolet,
            ),
          ],
        ),
      ],
    );
  }
}
