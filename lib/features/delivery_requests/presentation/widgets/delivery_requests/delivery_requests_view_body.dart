part of '../../feature_imports.dart';

class DeliveryRequestsViewBody extends StatelessWidget {
  const DeliveryRequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DeliveryRequestsSearchBar(),
        verticalSpace(AppSizes.h12),
        const DeliveryTypeTabs(),
        verticalSpace(AppSizes.h20),
        const DeliveryRequestsHeader(),
        Expanded(
          child: BlocBuilder<DeliveryRequestsCubit, DeliveryRequestsState>(
            buildWhen: (previous, current) =>
                previous.getDeliveryRequestsOrdersState !=
                current.getDeliveryRequestsOrdersState,
            builder: (context, state) {
              return state.getDeliveryRequestsOrdersState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => _buildContent(context, state, isLoading: true),
                data: (data) {
                  if (state.deliveryRequestsOrdersList.isEmpty) {
                    return Center(
                      child: EmptyWidget(
                        message: LocaleKeys.delivery_requests_empty_state.tr(),
                        imagePath: AppAssets.animationsEmpty,
                      ),
                    );
                  }
                  return _buildContent(context, state);
                },
                error: (failure) {
                  if (failure.status == LocalStatusCodes.connectionError) {
                    return InternetConnectionWidget(
                      onPressed: () => context
                          .read<DeliveryRequestsCubit>()
                          .getDeliveryRequestsOrders(),
                    );
                  }
                  return CustomErrorWidget(
                    message: failure.error,
                    onPressed: () => context
                        .read<DeliveryRequestsCubit>()
                        .getDeliveryRequestsOrders(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    DeliveryRequestsState state, {
    bool isLoading = false,
  }) {
    final List<DeliveryOrderModel> orders = isLoading
        ? List.generate(5, (_) => const DeliveryOrderModel())
        : state.deliveryRequestsOrdersList;

    return DeliveryRequestsListView(
      orders: orders,
      isLoading: isLoading,
      hasMore: state.hasMore,
      onRefresh: () =>
          context.read<DeliveryRequestsCubit>().getDeliveryRequestsOrders(),
    );
  }
}
