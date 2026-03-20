part of '../../feature_imports.dart';

class AddNewTicketDirectedToField extends StatelessWidget {
  const AddNewTicketDirectedToField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewTicketCubit, AddNewTicketState>(
      buildWhen: (previous, current) =>
          previous.getTicketSystemsState != current.getTicketSystemsState ||
          previous.selectedSystem != current.selectedSystem,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.add_ticket_directed_to.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h10),
            CustomDropdownSearchList<TicketSystemModel>(
              items: state.getTicketSystemsState.valueOrNull ?? [],
              hintText: LocaleKeys.add_ticket_directed_to_hint.tr(),
              itemAsString: (item) => item.name ?? '',
              initialValue: state.selectedSystem,
              onChanged: (system) {
                context.read<AddNewTicketCubit>().selectSystem(system);
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
