part of '../../feature_imports.dart';

class ShipmentsTypeShipmentList extends StatefulWidget {
  const ShipmentsTypeShipmentList({super.key});

  @override
  State<ShipmentsTypeShipmentList> createState() =>
      _ShipmentsTypeShipmentListState();
}

class _ShipmentsTypeShipmentListState extends State<ShipmentsTypeShipmentList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ShipmentTrackingCubit>().getAllShipments(isPagination: true);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentTrackingCubit, ShipmentTrackingState>(
      buildWhen: (previous, current) =>
          previous.shipments != current.shipments ||
          previous.isPaginationLoading != current.isPaginationLoading ||
          previous.hasReachedMax != current.hasReachedMax,
      builder: (context, state) {
        return state.shipments.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildList(context, state, isLoading: true),
          error: (failure) => failure.status == LocalStatusCodes.connectionError
              ? InternetConnectionWidget(
                  onPressed: () =>
                      context.read<ShipmentTrackingCubit>().initialize(),
                )
              : CustomErrorWidget(
                  message: failure.error,
                  onPressed: () =>
                      context.read<ShipmentTrackingCubit>().initialize(),
                ),
          data: (shipments) {
            if (shipments.isEmpty) {
              return EmptyWidget(
                message: LocaleKeys.shipment_tracking_no_shipments.tr(),
                imagePath: AppAssets.svgSearchResult,
                isSvg: true,
              );
            }
            return _buildList(context, state, shipments: shipments);
          },
        );
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    ShipmentTrackingState state, {
    List<ShipmentModel>? shipments,
    bool isLoading = false,
  }) {
    final list =
        shipments ?? List.generate(5, (index) => const ShipmentModel());

    return Skeletonizer(
      enabled: isLoading,
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<ShipmentTrackingCubit>().initialize(),
        child: ListView.separated(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w20,
            vertical: AppSizes.h8,
          ),
          itemCount: state.isPaginationLoading ? list.length + 1 : list.length,
          separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
          itemBuilder: (BuildContext context, int index) {
            if (index < list.length) {
              final shipment = list[index];
              return PickupCard(
                status: mapStatus(shipment.status),
                isAir:
                    shipment.shipmentType == 'جوي' ||
                    shipment.shipmentType == null,
                shipmentCode: shipment.code ?? '---',
                date: shipment.createdAt != null
                    ? formatDateFromApi(shipment.createdAt!)
                    : '---',
                shippingType: shipment.shipmentWay?.name ?? '',
                originWarehouse: shipment.receivingBranch ?? '---',
                originCountry: shipment.receivingCountry ?? '---',
                destinationWarehouse: shipment.deliveryBranch ?? '---',
                destinationCountry: shipment.deliveryCountry ?? '---',
                boxesCount: shipment.boxesCount?.toString() ?? '0',
                totalVolume: '${shipment.totalSize ?? 0} CMB',
                totalWeight: '${shipment.totalWeight ?? 0} KG',
                onTap: () {
                  if (shipment.id != null) {
                    context.push(Routes.shipmentDetails, extra: shipment);
                  }
                },
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

  // PickupRequestStatus _mapStatus(int? statusId) {
  //   if (statusId == 1) return PickupRequestStatus.pending;
  //   if (statusId == 2) return PickupRequestStatus.received;
  //   if (statusId == 3) return PickupRequestStatus.rejected;
  //   return PickupRequestStatus.pending;
  // }
}
