part of '../../feature_imports.dart';

class PickupRequestsListView extends StatefulWidget {
  const PickupRequestsListView({super.key});

  @override
  State<PickupRequestsListView> createState() => _PickupRequestsListViewState();
}

class _PickupRequestsListViewState extends State<PickupRequestsListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ShipmentPickupRequestsCubit>().getShipmentRequests(
        isPagination: true,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ShipmentPickupRequestsCubit,
      ShipmentPickupRequestsState
    >(
      buildWhen: (previous, current) =>
          previous.getShipmentRequestsState !=
              current.getShipmentRequestsState ||
          previous.isSearchLoading != current.isSearchLoading ||
          previous.isPaginationLoading != current.isPaginationLoading,
      builder: (context, state) {
        return state.getShipmentRequestsState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildList(context, state, isLoading: true),
          data: (data) {
            if ((data.requests == null || data.requests!.isEmpty) &&
                !state.isSearchLoading) {
              return EmptyWidget(
                message: LocaleKeys.shipment_pickup_requests_no_requests.tr(),
                imagePath: AppAssets.svgSearchResult,
                isSvg: true,
              );
            }
            return _buildList(
              context,
              state,
              data: data.requests,
              isLoading: state.isSearchLoading,
            );
          },
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () =>
                    context.read<ShipmentPickupRequestsCubit>().refresh(),
              );
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () =>
                  context.read<ShipmentPickupRequestsCubit>().refresh(),
            );
          },
        );
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    ShipmentPickupRequestsState state, {
    List<ShipmentRequestModel>? data,
    bool isLoading = false,
  }) {
    final list =
        data ?? List.generate(5, (index) => const ShipmentRequestModel());

    return Skeletonizer(
      enabled: isLoading,
      child: RefreshIndicator(
        onRefresh: () => context.read<ShipmentPickupRequestsCubit>().refresh(),
        child: ListView.separated(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w20,
            vertical: AppSizes.h8,
          ),
          itemCount: list.length + (state.isPaginationLoading ? 1 : 0),
          separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
          itemBuilder: (BuildContext context, int index) {
            if (index < list.length) {
              final item = list[index];
              return PickupCard(
                status: mapStatus(item.status?.name),
                shipmentCode: item.code ?? '---',
                date: item.createdAt != null
                    ? formatDateFromApi(item.createdAt!)
                    : '---',
                isAir:
                    item.shipmentType == "جوي" ||
                    item.shipmentType?.toLowerCase() == "air",
                shippingType: item.shipmentWay?.name ?? '---',
                originWarehouse: item.receivingBranch ?? '---',
                originCountry: item.receivingCountry ?? '---',
                destinationWarehouse: item.deliveryBranch ?? '---',
                destinationCountry: item.deliveryCountry ?? '---',
                boxesCount: item.boxesCount?.toString() ?? '0',
                totalVolume: item.totalSize ?? '---',
                totalWeight: item.totalWeight ?? '---',
                onTap: () =>
                    context.push(Routes.shipmentPickupDetails, extra: item),
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              ).withPadding(vertical: AppSizes.h16);
            }
          },
        ),
      ),
    );
  }
}
