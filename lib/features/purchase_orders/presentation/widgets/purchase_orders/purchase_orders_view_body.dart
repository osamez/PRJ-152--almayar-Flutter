part of '../../feature_imports.dart';

class PurchaseOrdersViewBody extends StatefulWidget {
  const PurchaseOrdersViewBody({super.key});

  @override
  State<PurchaseOrdersViewBody> createState() => _PurchaseOrdersViewBodyState();
}

class _PurchaseOrdersViewBodyState extends State<PurchaseOrdersViewBody> {
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
        _scrollController.position.maxScrollExtent - 200) {
      context.read<PurchaseOrdersCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PurchaseOrdersSearchBar(),
        verticalSpace(AppSizes.h12),
        const PurchaseOrdersAddButton(),
        verticalSpace(AppSizes.h20),
        BlocBuilder<PurchaseOrdersCubit, PurchaseOrdersState>(
          buildWhen: (previous, current) =>
              previous.getPurchaseRequestsState !=
                  current.getPurchaseRequestsState ||
              previous.isPaginationLoading != current.isPaginationLoading ||
              previous.isSearchLoading != current.isSearchLoading ||
              previous.orders != current.orders,
          builder: (context, state) {
            if (state.isSearchLoading && state.orders.isNotEmpty) {
              return _buildContent(context, state);
            }
            return state.getPurchaseRequestsState.when(
              initial: () => const SizedBox.shrink(),
              loading: () => _buildContent(context, state, isLoading: true),
              data: (data) => _buildContent(context, state),
              error: (failure) {
                if (failure.status == LocalStatusCodes.connectionError) {
                  return InternetConnectionWidget(
                    onPressed: () => context
                        .read<PurchaseOrdersCubit>()
                        .getPurchaseRequests(),
                  );
                }
                return CustomErrorWidget(
                  message: failure.error,
                  onPressed: () =>
                      context.read<PurchaseOrdersCubit>().getPurchaseRequests(),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    PurchaseOrdersState state, {
    bool isLoading = false,
  }) {
    final list = isLoading
        ? List.generate(3, (index) => const PurchaseOrderModel())
        : state.orders;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PurchaseOrdersFilterHeader(
            resultCount:
                state.getPurchaseRequestsState.valueOrNull?.meta?.total ?? 0,
          ),
          verticalSpace(AppSizes.h20),
          Expanded(
            child: Skeletonizer(
              enabled: isLoading,
              child: !isLoading && list.isEmpty
                  ? RefreshIndicator(
                      onRefresh: () => context
                          .read<PurchaseOrdersCubit>()
                          .getPurchaseRequests(isRefresh: true),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: AppSizes.h500,
                          child: EmptyWidget(
                            message: LocaleKeys
                                .shipment_pickup_requests_no_requests
                                .tr(),
                            imagePath: AppAssets.animationsEmpty,
                            isSvg: false,
                          ),
                        ),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => context
                          .read<PurchaseOrdersCubit>()
                          .getPurchaseRequests(isRefresh: true),
                      child: ListView.separated(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount:
                            list.length + (state.isPaginationLoading ? 1 : 0),
                        separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
                        itemBuilder: (BuildContext context, int index) {
                          if (index < list.length) {
                            final order = list[index];
                            return PurchaseOrderCard(
                              order: order,
                              onTap: () {
                                if (!isLoading) {
                                  context.push(
                                    Routes.purchaseOrderDetails,
                                    extra: order,
                                  );
                                }
                              },
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
