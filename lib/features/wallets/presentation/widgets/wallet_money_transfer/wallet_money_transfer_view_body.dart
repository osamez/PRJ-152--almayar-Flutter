part of '../../feature_imports.dart';

class WalletMoneyTransferViewBody extends StatefulWidget {
  const WalletMoneyTransferViewBody({super.key, required this.wallet});
  final WalletModel wallet;

  @override
  State<WalletMoneyTransferViewBody> createState() =>
      _WalletMoneyTransferViewBodyState();
}

class _WalletMoneyTransferViewBodyState
    extends State<WalletMoneyTransferViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _customerCodeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _customerCodeController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WalletMoneyTransferBlocListener(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WalletBanner(
                walletName: widget.wallet.walletName ?? '',
                balance: (widget.wallet.amount ?? 0).toString(),
                currencyKey: widget.wallet.currencyName ?? '',
              ),
              verticalSpace(AppSizes.h24),
              AppTextFormField(
                controller: _customerCodeController,
                isRequired: true,
                hintText: LocaleKeys.wallet_money_transfer_customer_code_hint
                    .tr(),
                title: LocaleKeys.wallet_money_transfer_customer_code.tr(),
                titleColor: AppColors.darkText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              verticalSpace(AppSizes.h16),
              AppTextFormField(
                controller: _amountController,
                isRequired: true,
                hintText: LocaleKeys.wallet_money_transfer_amount_hint.tr(),
                title: LocaleKeys.wallet_money_transfer_amount.tr(),
                titleColor: AppColors.darkText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              // verticalSpace(AppSizes.h16),
              // const WalletMoneyTransferSummaryCard(),
              verticalSpace(AppSizes.h32),
              WalletMoneyTransferSubmitButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<WalletMoneyTransferCubit>().sendOtp(
                      customerCode: _customerCodeController.text,
                      amount: _amountController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
