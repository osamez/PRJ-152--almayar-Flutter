part of '../../feature_imports.dart';

class GiftCardsViewBody extends StatelessWidget {
  const GiftCardsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<GiftCardsCubit, GiftCardsState>(
            buildWhen: (previous, current) =>
                previous.getGiftCardsState != current.getGiftCardsState,
            builder: (context, state) {
              return state.getGiftCardsState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const GiftCardsListView(isLoading: true),
                data: (data) {
                  if (data.isEmpty) {
                    return EmptyWidget(
                      message: LocaleKeys.gift_cards_empty_state.tr(),
                      imagePath: AppAssets.animationsEmpty,
                    );
                  }
                  return GiftCardsListView(data: data);
                },
                error: (failure) {
                  if (failure.status == LocalStatusCodes.connectionError) {
                    return InternetConnectionWidget(
                      onPressed: () =>
                          context.read<GiftCardsCubit>().getGiftCards(),
                    );
                  }
                  return CustomErrorWidget(
                    message: failure.message ?? failure.error,
                    onPressed: () =>
                        context.read<GiftCardsCubit>().getGiftCards(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
