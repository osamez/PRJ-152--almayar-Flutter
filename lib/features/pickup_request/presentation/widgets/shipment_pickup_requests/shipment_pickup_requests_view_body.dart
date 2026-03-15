part of '../../feature_imports.dart';

class ShipmentPickupRequestsViewBody extends StatefulWidget {
  const ShipmentPickupRequestsViewBody({super.key});

  @override
  State<ShipmentPickupRequestsViewBody> createState() =>
      _ShipmentPickupRequestsViewBodyState();
}

class _ShipmentPickupRequestsViewBodyState
    extends State<ShipmentPickupRequestsViewBody> {
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
        final isMainLoading = state.getShipmentRequestsState.isLoading;

        return Skeletonizer(
          enabled: isMainLoading,
          child: Column(
            children: [
              verticalSpace(AppSizes.h16),
              const PickupSearchBar().withPadding(horizontal: AppSizes.w20),
              verticalSpace(AppSizes.h16),
              const PickupShippingTypeTabs().withPadding(
                horizontal: AppSizes.w20,
              ),
              verticalSpace(AppSizes.h20),
              PickupFilterHeader(
                resultCount:
                    state.getShipmentRequestsState.valueOrNull?.meta?.total ??
                    0,
              ).withPadding(horizontal: AppSizes.w20),
              verticalSpace(AppSizes.h16),
              Expanded(
                child: state.getShipmentRequestsState.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => _buildContent(context, state, isLoading: true),
                  data: (data) {
                    if (data.requests == null || data.requests!.isEmpty) {
                      return EmptyWidget(
                        message: LocaleKeys.shipment_pickup_requests_no_requests
                            .tr(),
                        imagePath: AppAssets.svgSearchResult,
                        isSvg: true,
                      );
                    }
                    return _buildContent(
                      context,
                      state,
                      data: data.requests,
                      isLoading: state.isSearchLoading,
                    );
                  },
                  error: (failure) {
                    return CustomErrorWidget(
                      message: failure.error,
                      onPressed: () =>
                          context.read<ShipmentPickupRequestsCubit>().refresh(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(
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
                shipmentCode: item.trackingNumber ?? '---',
                date: item.createdAt ?? '---',
                shippingType: item.shipmentType ?? '---',
                originWarehouse: item.receivingBranch ?? '---',
                originCountry: '', // Add country if available
                destinationWarehouse: item.deliveryBranch ?? '---',
                destinationCountry: '', // Add country if available
                boxesCount: item.boxesCount?.toString() ?? '0',
                totalVolume: item.totalSize ?? '---',
                totalWeight: item.totalWeight ?? '---',
                onTap: () =>
                    context.push(Routes.shipmentPickupDetails, extra: item),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              ).withPadding(vertical: AppSizes.h16);
            }
          },
        ),
      ),
    );
  }
}
