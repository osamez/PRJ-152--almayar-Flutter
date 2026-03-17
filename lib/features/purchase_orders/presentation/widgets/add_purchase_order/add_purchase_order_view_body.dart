part of '../../feature_imports.dart';

class AddPurchaseOrderViewBody extends StatefulWidget {
  const AddPurchaseOrderViewBody({super.key});

  @override
  State<AddPurchaseOrderViewBody> createState() =>
      _AddPurchaseOrderViewBodyState();
}

class _AddPurchaseOrderViewBodyState extends State<AddPurchaseOrderViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _linkController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  void dispose() {
    _linkController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Outer BlocBuilder only handles the initial wallet-loading state (skeleton/error).
    return BlocBuilder<AddPurchaseOrderCubit, AddPurchaseOrderState>(
      buildWhen: (previous, current) =>
          previous.isLoadingInitial != current.isLoadingInitial ||
          previous.isErrorInitial != current.isErrorInitial,
      builder: (context, state) {
        if (state.isErrorInitial) {
          return CustomErrorWidget(
            message: state.errorInitial?.message ?? '',
            onPressed: () =>
                context.read<AddPurchaseOrderCubit>().initAdditionData(),
          ).center;
        }

        return Skeletonizer(
          enabled: state.isLoadingInitial,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Each dropdown manages its own BlocBuilder internally.
                        const AddPurchaseOrderShoppingSiteField(),
                        verticalSpace(AppSizes.h16),
                        AppTextFormField(
                          isRequired: true,
                          controller: _linkController,
                          hintText: LocaleKeys
                              .add_purchase_order_payment_link_hint
                              .tr(),
                          title: LocaleKeys.add_purchase_order_payment_link
                              .tr(),
                          titleColor: AppColors.darkText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.phone_required.tr();
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                        ),
                        verticalSpace(AppSizes.h16),
                        AppTextFormField(
                          isRequired: true,
                          controller: _valueController,
                          hintText: LocaleKeys
                              .add_purchase_order_value_in_dollars_hint
                              .tr(),
                          title: LocaleKeys.add_purchase_order_value_in_dollars
                              .tr(),
                          titleColor: AppColors.darkText,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.phone_required.tr();
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        verticalSpace(AppSizes.h16),
                        const AddPurchaseOrderWalletField(),
                      ],
                    ),
                  ),
                ),
                verticalSpace(AppSizes.h16),
                AppElevatedButton(
                  text: LocaleKeys.add_purchase_order_submit.tr(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final cubit =
                          context.read<AddPurchaseOrderCubit>();
                      final s = cubit.state;
                      cubit.addPurchaseRequest(
                        AddPurchaseRequestModel(
                          shoppingSiteId:
                              s.selectedShoppingSite?.id.toString() ?? '',
                          paymentLink: _linkController.text,
                          amountUsd: _valueController.text,
                          walletCurrencyId:
                              s.selectedWallet?.id.toString() ?? '',
                        ),
                      );
                    }
                  },
                  backgroundColor: AppColors.orange,
                ),
                verticalSpace(AppSizes.h8),
                const AddPurchaseOrderBlocListener(),
              ],
            ),
          ),
        );
      },
    );
  }
}
