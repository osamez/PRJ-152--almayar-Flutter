part of '../../feature_imports.dart';

class PickupShippingTypeTabs extends StatelessWidget {
  const PickupShippingTypeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ShipmentPickupRequestsCubit,
      ShipmentPickupRequestsState
    >(
      buildWhen: (previous, current) => previous.shipmentType != current.shipmentType,
      builder: (context, state) {
        final isAirSelected = state.shipmentType == ShipmentType.air;
        return Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.pickup_requests_air_shipping.tr(),
                onPressed:
                    () => context
                        .read<ShipmentPickupRequestsCubit>()
                        .changeShipmentType(ShipmentType.air),
                backgroundColor:
                    isAirSelected ? AppColors.orange : AppColors.white,
                borderColor: isAirSelected ? AppColors.orange : AppColors.gray,
                textColor:
                    isAirSelected ? AppColors.white : AppColors.darkSlate,
              ),
            ),
            horizontalSpace(AppSizes.w12),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.pickup_requests_sea_shipping.tr(),
                onPressed:
                    () => context
                        .read<ShipmentPickupRequestsCubit>()
                        .changeShipmentType(ShipmentType.sea),
                backgroundColor:
                    !isAirSelected ? AppColors.orange : AppColors.white,
                borderColor: !isAirSelected ? AppColors.orange : AppColors.gray,
                textColor:
                    !isAirSelected ? AppColors.white : AppColors.darkSlate,
              ),
            ),
          ],
        );
      },
    );
  }
}
