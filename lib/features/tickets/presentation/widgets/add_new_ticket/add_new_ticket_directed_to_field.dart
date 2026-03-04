part of '../../feature_imports.dart';

class AddNewTicketDirectedToField extends StatelessWidget {
  const AddNewTicketDirectedToField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isRequired: false,
      hintText: LocaleKeys.add_ticket_directed_to_hint.tr(),
      title: LocaleKeys.add_ticket_directed_to.tr(),
      titleColor: AppColors.darkText,
      readOnly: true,
      validator: (value) {},
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: AppSizes.w24,
        color: AppColors.hintColor,
      ),
    );
  }
}
