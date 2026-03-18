part of '../feature_imports.dart';

class MoneyTransferDetailsView extends StatelessWidget {
  const MoneyTransferDetailsView({super.key, required this.model});
  final MoneyTransferModel model;

  const MoneyTransferDetailsView.withModel(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.money_transfers_title.tr()),
      body: MoneyTransferDetailsViewBody(
        model: model,
      ).withPadding(horizontal: AppSizes.w20, vertical: AppSizes.h24),
    );
  }
}
