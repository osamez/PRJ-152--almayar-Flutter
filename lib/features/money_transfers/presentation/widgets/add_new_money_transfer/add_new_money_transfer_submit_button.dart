part of '../../feature_imports.dart';

class AddNewMoneyTransferSubmitButton extends StatelessWidget {
  const AddNewMoneyTransferSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.add_money_transfer_submit.tr(),
      onPressed: () {},
      backgroundColor: AppColors.orange,
      textColor: AppColors.white,
    );
  }
}
