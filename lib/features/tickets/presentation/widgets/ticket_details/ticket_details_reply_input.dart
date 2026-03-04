part of '../../feature_imports.dart';

class TicketDetailsReplyInput extends StatelessWidget {
  const TicketDetailsReplyInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h12,
      ),
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
        child: Row(
          children: [
            Expanded(
              child: AppTextFormField(
                hintText: LocaleKeys.ticket_details_reply_hint.tr(),
                validator: (p0) {},
                suffixIcon: SvgPicture.asset(
                  AppAssets.svgPaperclip,
                  width: AppSizes.w20,
                  height: AppSizes.h20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.darkSlate,
                    BlendMode.srcIn,
                  ),
                ).withPadding(vertical: AppSizes.h12, horizontal: AppSizes.w12),
              ),
            ),
            horizontalSpace(AppSizes.w8),

            CustomInkWellWidget(
              onTap: () {},
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
    );
  }
}
