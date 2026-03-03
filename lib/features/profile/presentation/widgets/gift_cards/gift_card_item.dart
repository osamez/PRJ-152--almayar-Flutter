part of '../../feature_imports.dart';

class GiftCardItem extends StatelessWidget {
  const GiftCardItem({
    super.key,
    required this.title,
    required this.cardValue,
    required this.currentBalance,
    required this.usageLimit,
    required this.expiryDate,
    required this.isValid,
  });

  final String title;
  final String cardValue;
  final String currentBalance;
  final String usageLimit;
  final String expiryDate;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.w16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1,
            blurRadius: AppSizes.w8,
            offset: Offset(0, AppSizes.h2),
          ),
        ],
      ),
      child: Column(
        children: [
          GiftCardHeader(title: title, isValid: isValid),
          verticalSpace(AppSizes.h32),
          GiftCardInfoRows(
            cardValue: cardValue,
            currentBalance: currentBalance,
            usageLimit: usageLimit,
            expiryDate: expiryDate,
          ),
        ],
      ),
    );
  }
}
