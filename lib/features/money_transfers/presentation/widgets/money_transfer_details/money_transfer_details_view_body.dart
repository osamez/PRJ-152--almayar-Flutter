part of '../../feature_imports.dart';

class MoneyTransferDetailsViewBody extends StatelessWidget {
  const MoneyTransferDetailsViewBody({super.key, required this.model});
  final MoneyTransferModel model;

  @override
  Widget build(BuildContext context) {
    final mediaItems = [model.paymentProofImage, model.invoiceImage]
        .whereType<String>()
        .map((url) => url.trim())
        .where((url) => url.isNotEmpty)
        .map(
          (url) => DetailsMediaItem(
            url: url,
            fileName: url.split('/').last,
            isImage: true,
          ),
        )
        .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.money_transfer_details_transfer_data.tr(),
            style: AppTextStyleFactory.create(
              size: 16,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
            textAlign: TextAlign.start,
          ),
          verticalSpace(AppSizes.h16),
          DetailsInfoCardSection(
            rows: [
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_supplier_name.tr(),
                value: model.supplierName ?? '-',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_supplier_address.tr(),
                value: model.supplierAddress ?? '-',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_supplier_phone.tr(),
                value: model.supplierPhone ?? '-',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_invoice_value.tr(),
                value: '\$${model.invoiceValue?.amount ?? '-'}',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_invoice_currency.tr(),
                value: model.invoiceCurrency ?? '-',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_payment_currency.tr(),
                value: model.paymentCurrency ?? '-',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.money_transfer_details_amount_in_yuan.tr(),
                value: model.yuanAmount != null
                    ? '${model.yuanAmount} يوان'
                    : '-',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.money_transfer_details_due_in_dollars.tr(),
                value: model.dollarAmount != null
                    ? '\$${model.dollarAmount}'
                    : '-',
              ),
            ],
          ),
          if (mediaItems.isNotEmpty) ...[
            verticalSpace(AppSizes.h24),
            Text(
              LocaleKeys.money_transfer_details_invoice_and_proof.tr(),
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            verticalSpace(AppSizes.h16),
            DetailsMediaGrid(items: mediaItems),
          ],
        ],
      ),
    );
  }
}
