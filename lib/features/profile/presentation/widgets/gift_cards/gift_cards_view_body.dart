part of '../../feature_imports.dart';

class GiftCardsViewBody extends StatelessWidget {
  const GiftCardsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h16,
      ),
      itemCount: _dummyGiftCards.length,
      separatorBuilder: (context, index) => verticalSpace(AppSizes.h16),
      itemBuilder: (context, index) {
        final card = _dummyGiftCards[index];
        return GiftCardItem(
          title: card.title,
          cardValue: card.cardValue,
          currentBalance: card.currentBalance,
          usageLimit: card.usageLimit,
          expiryDate: card.expiryDate,
          isValid: card.isValid,
        );
      },
    );
  }
}

List<_GiftCardData> get _dummyGiftCards => [
  _GiftCardData(
    title: LocaleKeys.gift_cards_gift_card.tr(),
    cardValue: '0 ${LocaleKeys.gift_cards_currency.tr()}',
    currentBalance: '0 ${LocaleKeys.gift_cards_currency.tr()}',
    usageLimit: '0 ${LocaleKeys.gift_cards_currency.tr()}',
    expiryDate: '22-10-2026',
    isValid: true,
  ),
  _GiftCardData(
    title: LocaleKeys.gift_cards_gift_card.tr(),
    cardValue: '0 ${LocaleKeys.gift_cards_currency.tr()}',
    currentBalance: '0 ${LocaleKeys.gift_cards_currency.tr()}',
    usageLimit: '0 ${LocaleKeys.gift_cards_currency.tr()}',
    expiryDate: '22-10-2026',
    isValid: false,
  ),
];

class _GiftCardData {
  const _GiftCardData({
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
}
