part of '../../feature_imports.dart';

class GiftCardsListView extends StatelessWidget {
  const GiftCardsListView({
    super.key,
    this.data = const [],
    this.isLoading = false,
  });

  final List<GiftCardModel> data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final displayList =
        isLoading ? List.filled(5, const GiftCardModel()) : data;

    return Skeletonizer(
      enabled: isLoading,
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<GiftCardsCubit>().getGiftCards();
        },
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w16,
            vertical: AppSizes.h20,
          ),
          itemBuilder: (context, index) {
            final card = displayList[index];
            return GiftCardItem(
              card: card,
            );
          },
          separatorBuilder: (context, index) => verticalSpace(AppSizes.h12),
          itemCount: displayList.length,
        ),
      ),
    );
  }
}
