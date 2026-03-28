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
    );

    if (!mounted) {
      return;
    }

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      context.read<AddNewMoneyTransferCubit>().setInvoiceFile(File(filePath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      listenWhen: (previous, current) =>
          previous.invoiceFile != current.invoiceFile,
      listener: (context, state) {
        _controller.text =
            state.invoiceFile?.path.split(Platform.pathSeparator).last ?? '';
      },
      buildWhen: (previous, current) =>
          previous.invoiceFile != current.invoiceFile,
      builder: (context, state) {
        final selectedFile = state.invoiceFile;
        final isPdf =
            selectedFile?.path.toLowerCase().endsWith('.pdf') ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              controller: _controller,
              hintText: LocaleKeys.add_money_transfer_invoice_upload_hint.tr(),
              validator: (value) {
                if (selectedFile == null) {
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
            if (selectedFile != null) ...[
              verticalSpace(AppSizes.h12),
              Container(
                padding: EdgeInsets.all(AppSizes.w8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(color: AppColors.gray),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (isPdf) {
                          AppDialogs.openFile(selectedFile, context);
                        } else {
                          AppDialogs.showImageViewerDialog(
                            context: context,
                            imageFile: selectedFile,
                          );
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        child: isPdf
                            ? Container(
                                width: double.infinity,
                                height: AppSizes.h120,
                                color: AppColors.offWhite,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppAssets.svgPdfFile,
                                  width: AppSizes.w40,
                                  height: AppSizes.h40,
                                ),
                              )
                            : Image.file(
                                selectedFile,
                                width: double.infinity,
                                height: AppSizes.h120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height: AppSizes.h120,
                                    color: AppColors.offWhite,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.broken_image_outlined,
                                      color: AppColors.hintColor,
                                      size: AppSizes.w30,
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                    verticalSpace(AppSizes.h8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedFile.path
                                .split(Platform.pathSeparator)
                                .last,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyleFactory.create(
                              size: 12,
                              weight: FontWeight.w400,
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => context
                              .read<AddNewMoneyTransferCubit>()
                              .setInvoiceFile(null),
                          icon: const Icon(
                            Icons.delete_outline,
                            color: AppColors.error500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
