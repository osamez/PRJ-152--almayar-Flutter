part of '../../feature_imports.dart';

class ConfirmTransferBottomSheet extends StatelessWidget {
  const ConfirmTransferBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (_) => BlocProvider(
        create: (_) => ConfirmTransferCubit()..startTimer(),
        child: const ConfirmTransferBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.w20,
        AppSizes.h16,
        AppSizes.w20,
        MediaQuery.of(context).viewInsets.bottom + AppSizes.h32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: AppSizes.w82,
              height: AppSizes.h8,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(AppSizes.radiusXxxl),
              ),
            ),
          ),
          verticalSpace(AppSizes.h24),
          Text(
            LocaleKeys.confirm_transfer_title.tr(),
            style: AppTextStyleFactory.create(
              size: 24,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
          verticalSpace(AppSizes.h32),
          Text(
            LocaleKeys.confirm_transfer_subtitle.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w400,
              color: AppColors.hintColor,
            ),
          ),
          verticalSpace(AppSizes.h24),
          const ConfirmTransferPinInput(),
          verticalSpace(AppSizes.h16),
          const ConfirmTransferTimerText(),
          verticalSpace(AppSizes.h32),
          AppElevatedButton(
            text: LocaleKeys.confirm_transfer_submit.tr(),
            onPressed: () {
              context.read<ConfirmTransferCubit>().confirmTransfer();
            },
          ),
        ],
      ),
    );
  }
}
