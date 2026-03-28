part of '../../feature_imports.dart';

class AddNewMoneyTransferSubmitButton extends StatelessWidget {
  const AddNewMoneyTransferSubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      buildWhen: (previous, current) =>
          previous.noteCalculateMoneyTransferState !=
          current.noteCalculateMoneyTransferState,
      builder: (context, state) {
        final isLoading = state.noteCalculateMoneyTransferState.isLoading;

        return isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : AppElevatedButton(
                text: LocaleKeys.add_money_transfer_submit.tr(),
                onPressed: onPressed,
                backgroundColor: AppColors.orange,
                textColor: AppColors.white,
              );
      },
    );
  }
}
