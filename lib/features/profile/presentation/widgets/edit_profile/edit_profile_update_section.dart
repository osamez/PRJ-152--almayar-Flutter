part of '../../feature_imports.dart';

class EditProfileUpdateSection extends StatelessWidget {
  const EditProfileUpdateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.edit_profile_update_account_data.tr(),
          style: AppTextStyleFactory.create(
            size: 16,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h20),
        AppTextFormField(
          hintText: '+90 2345678765432',
          validator: (value) {},
          titleColor: AppColors.lightHeadingText,
          title: LocaleKeys.edit_profile_whatsapp_number.tr(
            namedArgs: {'number': '2'},
          ),
          isRequired: false,
        ),

        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: '+90 2345678765432',
          validator: (value) {},
          title: LocaleKeys.edit_profile_whatsapp_number.tr(
            namedArgs: {'number': '3'},
          ),
          isRequired: false,
          titleColor: AppColors.lightHeadingText,
        ),

        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: '+90 2345678765432',
          validator: (value) {},
          title: LocaleKeys.edit_profile_whatsapp_number.tr(
            namedArgs: {'number': '4'},
          ),
          titleColor: AppColors.lightHeadingText,

          isRequired: false,
        ),
        verticalSpace(AppSizes.h24),
        const EditProfileSaveButton(),
      ],
    );
  }
}
