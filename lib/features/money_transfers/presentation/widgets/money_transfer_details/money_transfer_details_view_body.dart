part of '../../feature_imports.dart';

class MoneyTransferDetailsViewBody extends StatelessWidget {
  const MoneyTransferDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                value: 'مورد تجريبي',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_supplier_address.tr(),
                value: 'جوانزو الصين',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_supplier_phone.tr(),
                value: '+6476237482437',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_invoice_value.tr(),
                value: '\$2900',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_invoice_currency.tr(),
                value: 'الدولار الأمريكي',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.add_money_transfer_payment_currency.tr(),
                value: 'اليوان الصيني',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.money_transfer_details_amount_in_yuan.tr(),
                value: '14000 يوان',
              ),
              DetailsInfoRowData(
                label: LocaleKeys.money_transfer_details_due_in_dollars.tr(),
                value: '\$3000',
              ),
            ],
          ),
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
          const MediaGrid(
            items: [
              MediaItem(fileName: 'Box_Image.jpg', isImage: true),
              MediaItem(fileName: 'Box_Image.jpg', isImage: true),
            ],
          ),
        ],
      ),
    );
  }
}
