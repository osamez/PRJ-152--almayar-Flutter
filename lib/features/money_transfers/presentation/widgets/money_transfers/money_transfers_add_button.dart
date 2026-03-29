part of '../../feature_imports.dart';

class MoneyTransfersAddButton extends StatelessWidget {
  const MoneyTransfersAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.money_transfers_add_new_transfer.tr(),
      onPressed: () async {
        final result = await context.push<bool>(Routes.addNewMoneyTransfer);
        if (result == true && context.mounted) {
          context.read<MoneyTransfersCubit>().getMoneyTransfers();
        }
      },
      backgroundColor: AppColors.orange,
      textColor: AppColors.white,
      iconPath: AppAssets.svgAdd,
      iconHeight: AppSizes.h24,
      iconWidth: AppSizes.w24,
    );
  }
}
