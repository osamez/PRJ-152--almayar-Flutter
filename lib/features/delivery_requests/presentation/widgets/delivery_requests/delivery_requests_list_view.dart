part of '../../feature_imports.dart';

class DeliveryRequestsListView extends StatefulWidget {
  const DeliveryRequestsListView({
    super.key,
    required this.orders,
    required this.isLoading,
    required this.hasMore,
    required this.onRefresh,
  });

  final List<DeliveryOrderModel> orders;
  final bool isLoading;
  final bool hasMore;
  final RefreshCallback onRefresh;

  @override
  State<DeliveryRequestsListView> createState() =>
      _DeliveryRequestsListViewState();
}

class _DeliveryRequestsListViewState extends State<DeliveryRequestsListView> {
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
    return Skeletonizer(
      enabled: widget.isLoading,
      child: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: ListView.separated(
          controller: _scrollController,
          itemCount:
              widget.orders.length +
              (widget.hasMore && !widget.isLoading ? 1 : 0),
          separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
          itemBuilder: (context, index) {
            if (index < widget.orders.length) {
              final order = widget.orders[index];
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
    );
  }
}
