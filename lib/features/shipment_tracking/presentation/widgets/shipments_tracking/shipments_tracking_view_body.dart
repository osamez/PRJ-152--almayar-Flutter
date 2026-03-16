part of '../../feature_imports.dart';

class ShipmentsTrackingViewBody extends StatelessWidget {
  const ShipmentsTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentTrackingCubit, ShipmentTrackingState>(
      buildWhen: (previous, current) =>
          previous.shipmentStatusCounts != current.shipmentStatusCounts,
      builder: (context, state) {
        return state.shipmentStatusCounts.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildContent(context, state, isLoading: true),
          data: (data) => _buildContent(context, state, data: data),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () =>
                    context.read<ShipmentTrackingCubit>().getShipmentStatusCounts(),
              );
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () =>
                  context.read<ShipmentTrackingCubit>().getShipmentStatusCounts(),
            );
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    ShipmentTrackingState state, {
    List<ShipmentStatusCountModel>? data,
    bool isLoading = false,
  }) {
    return Column(
      children: [
        const ShipmentsTrackingTabBar(),
        verticalSpace(AppSizes.h20),
        Expanded(
          child: Skeletonizer(
            enabled: isLoading,
            child: ShipmentsTrackingStatusGrid(
              statusCounts: data,
            ),
          ),
        ),
      ],
    );
  }
}

