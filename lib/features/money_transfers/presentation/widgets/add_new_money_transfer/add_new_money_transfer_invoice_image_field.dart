part of '../../feature_imports.dart';

class AddNewMoneyTransferInvoiceImageField extends StatefulWidget {
  const AddNewMoneyTransferInvoiceImageField({super.key});

  @override
  State<AddNewMoneyTransferInvoiceImageField> createState() =>
      _AddNewMoneyTransferInvoiceImageFieldState();
}

class _AddNewMoneyTransferInvoiceImageFieldState
    extends State<AddNewMoneyTransferInvoiceImageField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickInvoiceImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      allowMultiple: true,
    );

    if (!mounted) {
      return;
    }

    if (result != null && result.files.isNotEmpty) {
      final List<File> files = result.files
          .where((file) => file.path != null)
          .map((file) => File(file.path!))
          .toList();
      context.read<AddNewMoneyTransferCubit>().addInvoiceFiles(files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      listenWhen: (previous, current) =>
          previous.invoiceFiles != current.invoiceFiles,
      listener: (context, state) {
        if (state.invoiceFiles.isEmpty) {
          _controller.text = '';
        } else {
          _controller.text =
              '${state.invoiceFiles.length} ${LocaleKeys.files_selected.tr()}';
        }
      },
      buildWhen: (previous, current) =>
          previous.invoiceFiles != current.invoiceFiles,
      builder: (context, state) {
        final selectedFiles = state.invoiceFiles;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              controller: _controller,
              hintText: LocaleKeys.add_money_transfer_invoice_upload_hint.tr(),
              validator: (value) {
                if (selectedFiles.isEmpty) {
                  return LocaleKeys.add_money_transfer_invoice_upload_hint.tr();
                }
                return null;
              },
              title: LocaleKeys.add_money_transfer_invoice.tr(),
              readOnly: true,
              onTap: _pickInvoiceImage,
              suffixIcon: SvgPicture.asset(
                AppAssets.svgPaperclip,
                width: AppSizes.w20,
                height: AppSizes.h20,
                colorFilter: const ColorFilter.mode(
                  AppColors.hintColor,
                  BlendMode.srcIn,
                ),
              ).withPadding(vertical: AppSizes.h12, horizontal: AppSizes.w12),
            ),
            if (selectedFiles.isNotEmpty) ...[
              verticalSpace(AppSizes.h12),
              SizedBox(
                height: AppSizes.h80,
                child: ListView.separated(
                  padding: const EdgeInsets.only(right: 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedFiles.length,
                  separatorBuilder: (context, index) =>
                      horizontalSpace(AppSizes.w12),
                  itemBuilder: (context, index) {
                    final file = selectedFiles[index];
                    final isPdf = file.path.toLowerCase().endsWith('.pdf');

                    return GestureDetector(
                      onTap: () {
                        if (isPdf) {
                          AppDialogs.openFile(file, context);
                        } else {
                          AppDialogs.showImageViewerDialog(
                            context: context,
                            imageFile: file,
                          );
                        }
                      },
                      child: MediaListItem(
                        file: file,
                        isPdf: isPdf,
                        onRemove: () => context
                            .read<AddNewMoneyTransferCubit>()
                            .removeInvoiceFile(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
