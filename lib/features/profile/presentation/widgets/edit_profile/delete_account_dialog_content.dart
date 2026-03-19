part of '../../feature_imports.dart';

class DeleteAccountDialogContent extends StatelessWidget {
  const DeleteAccountDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.w16),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.w24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.svgNotify,
              width: AppSizes.w100,
              height: AppSizes.h100,
            ),
            verticalSpace(AppSizes.h24),
            Text(
              LocaleKeys.delete_account_confirm_title.tr(),
              style: AppTextStyleFactory.create(
                size: 18,
                weight: FontWeight.w700,
                color: AppColors.darkSlate,
              ),
            ),
            verticalSpace(AppSizes.h8),
            Text(
              LocaleKeys.delete_account_confirm_desc.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.gray10,
              ),
            ),
            verticalSpace(AppSizes.h32),
            Row(
              children: [
                Expanded(
                  child: AppElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<UpdateProfileCubit>().deleteAccount();
                    },
                    text: LocaleKeys.delete_account.tr(),
                    backgroundColor: AppColors.error500,
                  ),
                ),
                horizontalSpace(AppSizes.w12),
                Expanded(
                  child: AppElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    text: LocaleKeys.cancel.tr(),
                    backgroundColor: AppColors.greyScale30,
                    textColor: AppColors.darkSlate,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
