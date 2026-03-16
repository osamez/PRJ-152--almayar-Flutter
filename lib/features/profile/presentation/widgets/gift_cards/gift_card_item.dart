part of '../../feature_imports.dart';

class GiftCardItem extends StatelessWidget {
  const GiftCardItem({super.key, required this.card});

  final GiftCardModel card;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
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
            GiftCardHeader(title: card.code ?? '', isValid: _isValid()),
            verticalSpace(AppSizes.h32),
            GiftCardInfoRows(
              cardValue:
                  '${card.value ?? 0} ${LocaleKeys.gift_cards_currency.tr()}',
              currentBalance:
                  '${card.remainingValue ?? 0} ${LocaleKeys.gift_cards_currency.tr()}',
              usageLimit:
                  '${card.valueUsed ?? 0} ${LocaleKeys.gift_cards_currency.tr()}',
              expiryDate: card.expiryDate ?? '',
            ),
          ],
        ),
      ),
    );
  }

  bool _isValid() {
    if (card.expiryDate == null || card.expiryDate!.isEmpty) {
      return true;
    }
    try {
      final DateTime expiryDate =
          DateTime.tryParse(card.expiryDate!) ??
          DateFormat('dd-MM-yyyy').parse(card.expiryDate!);
      return expiryDate.isAfter(DateTime.now());
    } catch (e) {
      return true;
    }
  }
}
