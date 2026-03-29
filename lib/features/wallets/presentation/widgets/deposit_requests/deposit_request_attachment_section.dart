part of '../../feature_imports.dart';

class DepositRequestAttachmentSection extends StatelessWidget {
  const DepositRequestAttachmentSection({super.key, this.isRequired = false});

  final bool isRequired;

  bool _isImageFile(String path) {
    final lower = path.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.gif');
  }

  @override
  Widget build(BuildContext context) {
    if (!isRequired) {
      return BlocBuilder<DepositRequestsCubit, DepositRequestsState>(
        buildWhen: (previous, current) =>
            previous.selectedFiles != current.selectedFiles,
        builder: (context, state) {
          return _buildContentWithState(context, state);
        },
      );
    }

    return FormField<int>(
      initialValue: context
          .read<DepositRequestsCubit>()
          .state
          .selectedFiles
          .length,
      validator: (count) {
        if ((count ?? 0) == 0) {
          return LocaleKeys.fieldRequired.tr();
        }
        return null;
      },
      builder: (field) {
        return BlocBuilder<DepositRequestsCubit, DepositRequestsState>(
          buildWhen: (previous, current) =>
              previous.selectedFiles != current.selectedFiles,
          builder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (field.value != state.selectedFiles.length) {
                field.didChange(state.selectedFiles.length);
              }
              if (field.hasError && state.selectedFiles.isNotEmpty) {
                field.validate();
              }
            });

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContentWithState(context, state),
                if (field.errorText != null) ...[
                  verticalSpace(AppSizes.h8),
                  Text(
                    field.errorText!,
                    style: AppTextStyleFactory.create(
                      size: 10,
                      weight: FontWeight.w600,
                      color: AppColors.error500,
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildContentWithState(
    BuildContext context,
    DepositRequestsState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.deposit_requests_transfer_proof_attach.tr(),
          textAlign: TextAlign.end,
          style: AppTextStyleFactory.create(
            size: 14,
            weight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h8),
        FileUploadItem(
          title: 'مرفق اثبات التحويل',
          text: state.selectedFiles.isEmpty
              ? LocaleKeys.deposit_requests_transfer_proof_attach_hint.tr()
              : '${state.selectedFiles.length} ${LocaleKeys.files_selected_label.tr()}',
          onTap: () => context.read<DepositRequestsCubit>().pickFiles(),
        ),
        if (state.selectedFiles.isNotEmpty) ...[
          verticalSpace(AppSizes.h8),
          Wrap(
            spacing: AppSizes.w8,
            runSpacing: AppSizes.h8,
            children: List.generate(state.selectedFiles.length, (index) {
              final file = state.selectedFiles[index];
              return MediaListItem(
                file: file,
                isPdf: !_isImageFile(file.path),
                onRemove: () =>
                    context.read<DepositRequestsCubit>().removeFile(index),
              );
            }),
          ),
        ],
      ],
    );
  }
}
