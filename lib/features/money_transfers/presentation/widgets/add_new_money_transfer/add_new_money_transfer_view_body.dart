part of '../../feature_imports.dart';

class AddNewMoneyTransferViewBody extends StatefulWidget {
  const AddNewMoneyTransferViewBody({super.key});

  @override
  State<AddNewMoneyTransferViewBody> createState() =>
      _AddNewMoneyTransferViewBodyState();
}

class _AddNewMoneyTransferViewBodyState
    extends State<AddNewMoneyTransferViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _supplierNameController = TextEditingController();
  final _supplierAddressController = TextEditingController();
  final _supplierPhoneController = TextEditingController();
  final _invoiceValueController = TextEditingController();
  final _notesController = TextEditingController();

  String _phoneCode = '+218';
  Timer? _debounce;

  @override
  void dispose() {
    _supplierNameController.dispose();
    _supplierAddressController.dispose();
    _supplierPhoneController.dispose();
    _invoiceValueController.dispose();
    _notesController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onCalculationTriggered() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final cubit = context.read<AddNewMoneyTransferCubit>();
      final state = cubit.state;

      if (_invoiceValueController.text.isNotEmpty &&
          state.selectedInvoiceCurrency != null &&
          state.selectedPaymentCurrency != null) {
        cubit.noteCalculateMoneyTransfer(
          NoteCalculateRequest(
            invoiceValue: _invoiceValueController.text.trim(),
            currencyId: state.selectedInvoiceCurrency!.id.toString(),
            paymentCurrencyId: state.selectedPaymentCurrency!.id.toString(),
          ),
        );
      }
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final cubit = context.read<AddNewMoneyTransferCubit>();
    final state = cubit.state;

    cubit.addMoneyTransfer(
      invoiceImages: state.invoiceFiles.isEmpty ? null : state.invoiceFiles,
      invoiceValue: _invoiceValueController.text.trim(),
      paymentCurrencyId: state.selectedPaymentCurrency?.id?.toString(),
      currencyId: state.selectedInvoiceCurrency?.id?.toString(),
      supplierName: _supplierNameController.text.trim(),
      supplierAddress: _supplierAddressController.text.trim(),
      supplierPhoneCode: _phoneCode,
      supplierPhone: _supplierPhoneController.text.trim().substring(1),
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      buildWhen: (previous, current) =>
          previous.getMoneyTransferCurrenciesState !=
          current.getMoneyTransferCurrenciesState,
      builder: (context, state) {
        return state.getMoneyTransferCurrenciesState.when(
          initial: () => _buildContent(isLoading: true),
          loading: () => _buildContent(isLoading: true),
          data: (_) => _buildContent(isLoading: false),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () => context
                    .read<AddNewMoneyTransferCubit>()
                    .getMoneyTransferCurrencies(),
              );
            }

            return CustomErrorWidget(
              message: failure.error,
              onPressed: () => context
                  .read<AddNewMoneyTransferCubit>()
                  .getMoneyTransferCurrencies(),
            );
          },
        );
      },
    );
  }

  Widget _buildContent({required bool isLoading}) {
    return Skeletonizer(
      enabled: isLoading,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const AddNewMoneyTransferBlocListener(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextFormField(
                      controller: _supplierNameController,
                      hintText: LocaleKeys.add_money_transfer_supplier_name_hint
                          .tr(),
                      title: LocaleKeys.add_money_transfer_supplier_name.tr(),
                      titleColor: AppColors.darkText,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return LocaleKeys
                              .add_money_transfer_supplier_name_hint
                              .tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    verticalSpace(AppSizes.h16),
                    AppTextFormField(
                      controller: _supplierAddressController,
                      hintText: LocaleKeys
                          .add_money_transfer_supplier_address_hint
                          .tr(),
                      title: LocaleKeys.add_money_transfer_supplier_address
                          .tr(),
                      titleColor: AppColors.darkText,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return LocaleKeys
                              .add_money_transfer_supplier_address_hint
                              .tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.streetAddress,
                    ),
                    verticalSpace(AppSizes.h16),
                    PhoneFormField(
                      controller: _supplierPhoneController,
                      title: LocaleKeys.add_money_transfer_supplier_phone.tr(),
                      hintText: LocaleKeys
                          .add_money_transfer_supplier_phone_hint
                          .tr(),
                      onCountryChanged: (code) => _phoneCode = code,
                    ),
                    verticalSpace(AppSizes.h16),
                    const AddNewMoneyTransferInvoiceImageField(),
                    verticalSpace(AppSizes.h16),
                    AppTextFormField(
                      controller: _invoiceValueController,
                      onChanged: (value) => _onCalculationTriggered(),
                      hintText: LocaleKeys.add_money_transfer_invoice_value_hint
                          .tr(),
                      title: LocaleKeys.add_money_transfer_invoice_value.tr(),
                      titleColor: AppColors.darkText,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return LocaleKeys.amount_required.tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    verticalSpace(AppSizes.h16),
                    AddNewMoneyTransferInvoiceCurrencyField(
                      onChanged: (_) => _onCalculationTriggered(),
                    ),
                    verticalSpace(AppSizes.h16),
                    AddNewMoneyTransferPaymentCurrencyField(
                      onChanged: (_) => _onCalculationTriggered(),
                    ),
                    const AddNewMoneyTransferExchangeRateWarning(),
                    verticalSpace(AppSizes.h16),
                    AppTextFormField(
                      isRequired: false,
                      controller: _notesController,
                      hintText: LocaleKeys.add_money_transfer_notes_hint.tr(),
                      title: LocaleKeys.add_money_transfer_notes.tr(),
                      titleColor: AppColors.darkText,
                      validator: (value) => null,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(AppSizes.h16),
            AddNewMoneyTransferSubmitButton(onPressed: _submit),
            verticalSpace(AppSizes.h8),
          ],
        ),
      ),
    );
  }
}
