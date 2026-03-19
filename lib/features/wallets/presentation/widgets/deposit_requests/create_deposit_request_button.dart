part of '../../feature_imports.dart';

class CreateDepositRequestButton extends StatelessWidget {
  const CreateDepositRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.deposit_requests_create_request.tr(),
      onPressed: () {},
      radius: AppSizes.radiusMd,
      height: AppSizes.h56,
      backgroundColor: AppColors.orange,
      textStyle: AppTextStyleFactory.create(
        size: 16,
        weight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}
