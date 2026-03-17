part of '../../feature_imports.dart';

/// Self-contained shopping site dropdown.
/// Reads data directly from [AddPurchaseOrderCubit] and handles
/// its own rebuild via a scoped [BlocBuilder].
class AddPurchaseOrderShoppingSiteField extends StatelessWidget {
  const AddPurchaseOrderShoppingSiteField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPurchaseOrderCubit, AddPurchaseOrderState>(
      buildWhen: (previous, current) =>
          previous.shoppingSitesList != current.shoppingSitesList ||
          previous.getShoppingSitesState != current.getShoppingSitesState ||
          previous.selectedShoppingSite != current.selectedShoppingSite ||
          previous.shoppingSitesHasMore != current.shoppingSitesHasMore,
      builder: (context, state) {
        final cubit = context.read<AddPurchaseOrderCubit>();
        final isLoadingMore = state.getShoppingSitesState.isLoading &&
            state.shoppingSitesPage > 1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.add_purchase_order_shopping_site.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.darkText,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<ShoppingSiteModel>(
              items: state.shoppingSitesList,
              initialValue: state.selectedShoppingSite,
              onChanged: cubit.selectShoppingSite,
              itemAsString: (item) => item.name ?? '',
              hintText: LocaleKeys.add_purchase_order_shopping_site_hint.tr(),
              isLoadingMore: isLoadingMore,
              hasMore: state.shoppingSitesHasMore,
              onSearchChanged: (query) =>
                  cubit.getShoppingSites(name: query, page: 1),
              onLoadMore: () => cubit.loadMoreShoppingSites(),
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.please_select_branch.tr();
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
