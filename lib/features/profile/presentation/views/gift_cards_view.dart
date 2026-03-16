part of '../feature_imports.dart';

class GiftCardsView extends StatelessWidget {
  const GiftCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GiftCardsCubit>()..getGiftCards(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.gift_cards_title.tr()),
        body: const GiftCardsViewBody(),
      ),
    );
  }
}
