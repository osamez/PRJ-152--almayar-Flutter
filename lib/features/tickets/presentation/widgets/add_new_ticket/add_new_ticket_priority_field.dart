part of '../../feature_imports.dart';

class AddNewTicketPriorityField extends StatelessWidget {
  const AddNewTicketPriorityField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewTicketCubit, AddNewTicketState>(
      buildWhen: (previous, current) =>
          previous.getTicketPrioritiesState !=
              current.getTicketPrioritiesState ||
          previous.selectedPriority != current.selectedPriority,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.add_ticket_priority.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h10),

            CustomDropdownSearchList<TicketPriorityModel>(
              items: state.getTicketPrioritiesState.valueOrNull ?? [],
              hintText: LocaleKeys.add_ticket_priority_hint.tr(),
              itemAsString: (item) => item.name ?? '',
              initialValue: state.selectedPriority,
              onChanged: (priority) {
                context.read<AddNewTicketCubit>().selectPriority(priority);
              },
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.fieldRequired.tr();
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
