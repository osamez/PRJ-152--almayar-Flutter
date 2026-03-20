part of '../feature_imports.dart';

class DepositRequestsView extends StatelessWidget {
  const DepositRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.deposit_requests_title.tr()),
      body: const DepositRequestsViewBody().withPadding(
        vertical: AppSizes.h24,
        horizontal: AppSizes.w20,
      ),
    );
  }
}
