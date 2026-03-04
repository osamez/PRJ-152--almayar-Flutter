part of '../../feature_imports.dart';

class AddNewTicketViewBody extends StatelessWidget {
  const AddNewTicketViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  LocaleKeys.add_ticket_heading.tr(),
                  textAlign: TextAlign.start,
                  style: AppTextStyleFactory.create(
                    size: 16,
                    weight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
                verticalSpace(AppSizes.h20),
                AppTextFormField(
                  hintText: LocaleKeys.add_ticket_title_hint.tr(),
                  title: LocaleKeys.add_ticket_title.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  keyboardType: TextInputType.text,
                ),
                verticalSpace(AppSizes.h16),
                const AddNewTicketDirectedToField(),
                verticalSpace(AppSizes.h16),
                const AddNewTicketPriorityField(),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_ticket_shipment_code_hint.tr(),
                  title: LocaleKeys.add_ticket_shipment_code.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  keyboardType: TextInputType.text,
                ),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_ticket_description_hint.tr(),
                  title: LocaleKeys.add_ticket_description.tr(),
                  titleColor: AppColors.darkText,
                  validator: (value) {},
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                ),
                verticalSpace(AppSizes.h16),
                AppTextFormField(
                  isRequired: false,
                  hintText: LocaleKeys.add_ticket_attachment_hint.tr(),
                  title: LocaleKeys.add_ticket_attachment.tr(),
                  titleColor: AppColors.darkText,
                  readOnly: true,
                  validator: (value) {},
                  suffixIcon:
                      SvgPicture.asset(
                        AppAssets.svgPaperclip,
                        width: AppSizes.w20,
                        height: AppSizes.h20,
                        colorFilter: const ColorFilter.mode(
                          AppColors.hintColor,
                          BlendMode.srcIn,
                        ),
                      ).withPadding(
                        vertical: AppSizes.h12,
                        horizontal: AppSizes.w12,
                      ),
                ),
              ],
            ),
          ),
        ),
        verticalSpace(AppSizes.h16),
        const AddNewTicketSubmitButton(),
        verticalSpace(AppSizes.h8),
      ],
    );
  }
}
