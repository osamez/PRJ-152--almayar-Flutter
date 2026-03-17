part of '../../feature_imports.dart';

class RequestItemDetailsFinancialDataTab extends StatelessWidget {
  const RequestItemDetailsFinancialDataTab({super.key, this.order});
  final DeliveryOrderDetailsModel? order;

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
              value:
                  '${order?.deliveryPrice ?? 0} ${LocaleKeys.wallets_currency_lyd.tr()}',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys
                  .delivery_request_details_total_boxes_shipping_cost
                  .tr(),
              value: '\$${order?.invoice?.totalPriceBoxes ?? 0}',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_bundle_discount.tr(),
              value: '\$${order?.invoice?.planDiscountValue ?? '0'}-',
              valueColor: AppColors.orange,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_coupon_discount.tr(),
              value: '\$${order?.invoice?.couponDiscountValue ?? '0'}-',
              valueColor: AppColors.orange,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_gift_card_discount
                  .tr(),
              value: '\$${order?.invoice?.giftCardDiscountValue ?? '0'}-',
              valueColor: AppColors.orange,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_admin_discount.tr(),
              value: '\$${order?.invoice?.administrativeDiscount ?? '0'}-',
              valueColor: AppColors.orange,
            ),
          ],
        ),
        verticalSpace(AppSizes.h24),
        RequestItemDetailsSectionTitle(
          title: LocaleKeys.delivery_request_details_financial_summary.tr(),
        ),
        verticalSpace(AppSizes.h16),
        RequestItemDetailsFinancialSummary(
          totalBoxesCost: '\$${order?.invoice?.totalPriceBoxes ?? 0}',
          totalDiscounts: '\$${order?.invoice?.totalDiscount ?? '0'}-',
          amountDue: '\$${order?.invoice?.totalPrice ?? 0}',
          deliveryCost:
              '${order?.deliveryPrice ?? 0} ${LocaleKeys.wallets_currency_lyd.tr()}',
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
              value: order?.invoice?.paymentMethod ?? '-',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_payment_currency.tr(),
              value: order?.invoice?.currencyUsedPayment ?? '-',
              valueColor: AppColors.deepViolet,
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_amount_paid_usd.tr(),
              value: '\$${order?.invoice?.amountPaidDollar ?? '0'}',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_amount_paid_lyd.tr(),
              value: '${order?.invoice?.amountPaidDinar ?? '0'} د.ل',
            ),

            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_cash_from_delivery
                  .tr(),
              value:
                  '${order?.invoice?.deliveryCashTaken ?? 0} ${LocaleKeys.wallets_currency_lyd.tr()}',
            ),
            RequestItemDetailsInfoRowData(
              label: LocaleKeys.delivery_request_details_delivery_cost.tr(),
              value:
                  '${order?.deliveryPrice ?? 0} ${LocaleKeys.wallets_currency_lyd.tr()}',
            ),
          ],
        ),
      ],
    );
  }
}
