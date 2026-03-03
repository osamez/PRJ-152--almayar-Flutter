part of '../../feature_imports.dart';

class AddNewMoneyTransferViewBody extends StatelessWidget {
  const AddNewMoneyTransferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_money_transfer_supplier_name_hint
                      .tr(),
                  title: LocaleKeys.add_money_transfer_supplier_name.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  keyboardType: TextInputType.name,
                ),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_money_transfer_supplier_address_hint
                      .tr(),
                  title: LocaleKeys.add_money_transfer_supplier_address.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  keyboardType: TextInputType.streetAddress,
                ),
                verticalSpace(AppSizes.h16),
                PhoneFormField(
                  title: LocaleKeys.add_money_transfer_supplier_phone.tr(),
                  hintText: LocaleKeys.add_money_transfer_supplier_phone_hint
                      .tr(),
                ),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  hintText: LocaleKeys.add_money_transfer_invoice_upload_hint
                      .tr(),
                  validator: (value) {},
                  title: LocaleKeys.add_money_transfer_invoice.tr(),
                  suffixIcon:
                      SvgPicture.asset(
                        AppAssets.svgPaperclip,
                        width: AppSizes.w20,
                        height: AppSizes.h20,
                        colorFilter: const ColorFilter.mode(
                          AppColors.hintColor,
                          BlendMode.srcIn,
                        ),
                      ).withPadding(
                        vertical: AppSizes.h12,
                        horizontal: AppSizes.w12,
                      ),
                ),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_money_transfer_invoice_value_hint
                      .tr(),
                  title: LocaleKeys.add_money_transfer_invoice_value.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  keyboardType: TextInputType.number,
                ),
                verticalSpace(AppSizes.h16),
                const AddNewMoneyTransferInvoiceCurrencyField(),
                verticalSpace(AppSizes.h16),
                const AddNewMoneyTransferPaymentCurrencyField(),
                verticalSpace(AppSizes.h16),
                const AddNewMoneyTransferExchangeRateWarning(),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_money_transfer_notes_hint.tr(),
                  title: LocaleKeys.add_money_transfer_notes.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                ),
              ],
            ),
          ),
        ),
        verticalSpace(AppSizes.h16),
        const AddNewMoneyTransferSubmitButton(),
        verticalSpace(AppSizes.h8),
      ],
    );
  }
}
