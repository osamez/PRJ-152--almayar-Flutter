part of '../../feature_imports.dart';

class TicketDetailsReplyInput extends StatefulWidget {
  final int ticketId;
  const TicketDetailsReplyInput({super.key, required this.ticketId});

  @override
  State<TicketDetailsReplyInput> createState() => _TicketDetailsReplyInputState();
}

class _TicketDetailsReplyInputState extends State<TicketDetailsReplyInput> {
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  void _onSend() {
    final text = _replyController.text.trim();
    if (text.isEmpty) {
      return;
    }

    final cubit = context.read<TicketDetailsCubit>();
    cubit.replyTicket(
      ticketId: widget.ticketId.toString(),
      description: text.isNotEmpty ? text : null,
    );

    _replyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketDetailsCubit, TicketDetailsState>(
      buildWhen: (previous, current) => previous.selectedFile != current.selectedFile,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow1.withValues(alpha: 0.8),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.selectedFile != null)
                  _buildImagePreview(context, state.selectedFile!),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w16,
                    vertical: AppSizes.h12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: _replyController,
                          hintText: LocaleKeys.ticket_details_reply_hint.tr(),
                          validator: (p0) {},
                          suffixIcon: GestureDetector(
                            onTap: () => context.read<TicketDetailsCubit>().pickImage(),
                            child: SvgPicture.asset(
                              AppAssets.svgPaperclip,
                              width: AppSizes.w20,
                              height: AppSizes.h20,
                              colorFilter: const ColorFilter.mode(
                                AppColors.darkSlate,
                                BlendMode.srcIn,
                              ),
                            ).withPadding(
                              vertical: AppSizes.h12,
                              horizontal: AppSizes.w12,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(AppSizes.w8),
                      CustomInkWellWidget(
                        onTap: _onSend,
                        radius: AppSizes.radiusSm,
                        padding: EdgeInsets.all(AppSizes.w8),
                        child: Icon(
                          Icons.send,
                          color: AppColors.orange,
                          size: AppSizes.w24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePreview(BuildContext context, File file) {
    return Container(
      padding: EdgeInsets.all(AppSizes.w12),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: AppSizes.w80,
            height: AppSizes.h80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: AppColors.greyScale30, width: 1),
            ),
          ),
          Positioned(
            top: -AppSizes.h8,
            right: -AppSizes.w8,
            child: GestureDetector(
              onTap: () => context.read<TicketDetailsCubit>().removeImage(),
              child: Container(
                padding: EdgeInsets.all(AppSizes.w4),
                decoration: const BoxDecoration(
                  color: AppColors.error500,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: AppSizes.w16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
