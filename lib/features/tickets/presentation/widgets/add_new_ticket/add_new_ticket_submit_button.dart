part of '../../feature_imports.dart';

class AddNewTicketSubmitButton extends StatelessWidget {
  const AddNewTicketSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        // TODO: Handle form submission
      },
      text: LocaleKeys.add_ticket_save.tr(),
      backgroundColor: AppColors.orange,
    );
  }
}
