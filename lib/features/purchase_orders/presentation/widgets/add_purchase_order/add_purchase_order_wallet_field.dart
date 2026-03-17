part of '../../feature_imports.dart';

/// Self-contained wallet dropdown.
/// Reads data directly from [AddPurchaseOrderCubit] and handles
/// its own rebuild via a scoped [BlocBuilder].
class AddPurchaseOrderWalletField extends StatelessWidget {
  const AddPurchaseOrderWalletField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPurchaseOrderCubit, AddPurchaseOrderState>(
      buildWhen: (previous, current) =>
          previous.getMyWalletsState != current.getMyWalletsState ||
          previous.selectedWallet != current.selectedWallet,
      builder: (context, state) {
        final cubit = context.read<AddPurchaseOrderCubit>();
        final wallets = state.getMyWalletsState.valueOrNull ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.add_purchase_order_payment_wallet.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.darkText,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<WalletModel>(
              items: wallets,
              initialValue: state.selectedWallet,
              onChanged: cubit.selectWallet,
              itemAsString: (item) =>
                  '${item.walletName} (${item.amount} ${item.currencyCode})',
              hintText:
                  LocaleKeys.add_purchase_order_payment_wallet_hint.tr(),
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.please_select_branch.tr();
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
