part of '../../feature_imports.dart';

class AddNewTicketMediaSection extends StatelessWidget {
  const AddNewTicketMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewTicketCubit, AddNewTicketState>(
      buildWhen: (previous, current) =>
          previous.selectedFiles != current.selectedFiles,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FileUploadItem(
              text: state.selectedFiles.isEmpty
                  ? LocaleKeys.add_ticket_attachment_hint.tr()
                  : '${state.selectedFiles.length} ${LocaleKeys.files_selected_label.tr()}',
              onTap: () => context.read<AddNewTicketCubit>().pickFiles(),
            ),
            if (state.selectedFiles.isNotEmpty) ...[
              verticalSpace(AppSizes.h8),
              Wrap(
                spacing: AppSizes.w8,
                runSpacing: AppSizes.h8,
                children: List.generate(
                  state.selectedFiles.length,
                  (index) => MediaListItem(
                    file: state.selectedFiles[index],
                    onRemove: () =>
                        context.read<AddNewTicketCubit>().removeFile(index),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
