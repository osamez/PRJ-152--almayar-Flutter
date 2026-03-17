part of '../../feature_imports.dart';

class RequestItemDetailsFinancialDataTab extends StatelessWidget {
  const RequestItemDetailsFinancialDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RequestItemDetailsSectionTitle(
          title: LocaleKeys.delivery_request_details_financial_data_title.tr(),
        ),
        verticalSpace(AppSizes.h20),
        RequestItemDetailsInfoSection(
          rows: [
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delivery_cost.tr(),
              value: '20 دينار ليبي',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys
                  .delivery_request_details_total_boxes_shipping_cost
                  .tr(),
              value: '\$4000',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_bundle_discount.tr(),
              value: '\$200-',
              valueColor: AppColors.orange,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_coupon_discount.tr(),
              value: '\$200-',
              valueColor: AppColors.orange,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_gift_card_discount
                  .tr(),
              value: LocaleKeys.delivery_request_details_no_value.tr(),
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_admin_discount.tr(),
              value: '\$200-',
              valueColor: AppColors.orange,
            ),
          ],
        ),
        verticalSpace(AppSizes.h24),
        RequestItemDetailsSectionTitle(
          title: LocaleKeys.delivery_request_details_financial_summary.tr(),
        ),
        verticalSpace(AppSizes.h16),
        const RequestItemDetailsFinancialSummary(
          totalBoxesCost: '\$4000',
          totalDiscounts: '\$600-',
          amountDue: '\$3400',
          deliveryCost: '20 دينار ليبي',
        ),
        verticalSpace(AppSizes.h24),
        RequestItemDetailsSectionTitle(
          title: LocaleKeys.delivery_request_details_payment_info.tr(),
        ),
        verticalSpace(AppSizes.h16),
        RequestItemDetailsInfoSection(
          rows: [
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_payment_method.tr(),
              value: 'نقدي',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_payment_currency.tr(),
              value: 'دولار ودينار',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_amount_paid_usd.tr(),
              value: '\$3000',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_amount_paid_lyd.tr(),
              value: '4000 د.ل',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_cash_from_delivery
                  .tr(),
              value: '20 دينار ليبي',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delivery_cost.tr(),
              value: '20 دينار ليبي',
            ),
          ],
        ),
      ],
    );
  }
}
