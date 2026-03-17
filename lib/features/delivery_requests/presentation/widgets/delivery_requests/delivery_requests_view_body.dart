part of '../../feature_imports.dart';

class DeliveryRequestsViewBody extends StatefulWidget {
  const DeliveryRequestsViewBody({super.key});

  @override
  State<DeliveryRequestsViewBody> createState() =>
      _DeliveryRequestsViewBodyState();
}

class _DeliveryRequestsViewBodyState extends State<DeliveryRequestsViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<DeliveryRequestsCubit>().getDeliveryRequestsOrders(
        loadMore: true,
      );
    }
  }

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
                    return Expanded(
                      child: Center(
                        child: EmptyWidget(
                          message: LocaleKeys.delivery_requests_empty_state
                              .tr(),
                          imagePath: AppAssets.animationsEmpty,
                        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(AppSizes.h20),
        Expanded(
          child: Skeletonizer(
            enabled: isLoading,
            child: ListView.separated(
              controller: _scrollController,
              itemCount: orders.length + (state.hasMore && !isLoading ? 1 : 0),
              separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
              itemBuilder: (context, index) {
                if (index < orders.length) {
                  final order = orders[index];
                  return DeliveryRequestCard(
                    order: order,
                    onTap: () {
                      context.pushNamed(
                        Routes.deliveryRequestsDetails,
                        extra: order.id,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ).withPadding(vertical: AppSizes.h10);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
