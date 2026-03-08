part of '../feature_imports.dart';

class WalletBanner extends StatelessWidget {
  const WalletBanner({
    super.key,
    required this.walletName,
    required this.balance,
    required this.currencyKey,
  });

  final String walletName;
  final String balance;
  final String currencyKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w24,
        vertical: AppSizes.h20,
      ),
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            walletName.tr(),
            style: AppTextStyleFactory.create(
              size: 16,
              weight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          verticalSpace(AppSizes.h4),
          Text(
            LocaleKeys.account_statement_wallet_balance.tr(
              namedArgs: {'balance': balance, 'currency': currencyKey.tr()},
            ),
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
