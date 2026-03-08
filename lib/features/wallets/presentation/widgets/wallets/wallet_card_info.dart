part of '../../feature_imports.dart';

class WalletCardInfo extends StatelessWidget {
  const WalletCardInfo({
    super.key,
    required this.walletName,
    required this.balance,
  });

  final String walletName;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          walletName,
          style: AppTextStyleFactory.create(
            size: 18,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h4),
        Text(
          balance,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w400,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}
