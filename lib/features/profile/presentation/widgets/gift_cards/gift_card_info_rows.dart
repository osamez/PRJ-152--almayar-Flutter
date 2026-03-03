part of '../../feature_imports.dart';

class GiftCardInfoRows extends StatelessWidget {
  const GiftCardInfoRows({
    super.key,
    required this.cardValue,
    required this.currentBalance,
    required this.usageLimit,
    required this.expiryDate,
  });

  final String cardValue;
  final String currentBalance;
  final String usageLimit;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInfoRow(
          label: LocaleKeys.gift_cards_card_value.tr(),
          value: cardValue,
        ),
        verticalSpace(AppSizes.h8),
        _buildInfoRow(
          label: LocaleKeys.gift_cards_current_balance.tr(),
          value: currentBalance,
        ),
        verticalSpace(AppSizes.h8),
        _buildInfoRow(
          label: LocaleKeys.gift_cards_usage_limit.tr(),
          value: usageLimit,
        ),
        verticalSpace(AppSizes.h8),
        _buildInfoRow(
          label: LocaleKeys.gift_cards_expiry_date.tr(),
          value: expiryDate,
        ),
      ],
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w400,
            color: AppColors.darkText,
          ),
        ),
        Text(
          value,
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
