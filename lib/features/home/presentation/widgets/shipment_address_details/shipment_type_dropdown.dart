part of '../../feature_imports.dart';

class ShipmentTypeDropdown extends StatelessWidget {
  final BranchDetailsModel? branchDetails;

  const ShipmentTypeDropdown({super.key, this.branchDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.shipment_details_shipping_type.tr(),
          style: AppTextStyleFactory.create(
            size: 14,
            weight: FontWeight.w600,
            color: AppColors.lightHeadingText,
          ),
        ),
        verticalSpace(AppSizes.h8),
        BlocBuilder<ShipmentsAddressesCubit, ShipmentsAddressesState>(
          buildWhen: (previous, current) =>
              previous.selectedDropdownShipmentType !=
              current.selectedDropdownShipmentType,
          builder: (context, state) {
            return CustomDropdownSearchList<ShippingWay>(
              items: branchDetails?.availableShippingWays ?? [],
              initialValue: state.selectedDropdownShipmentType,

              onChanged: (val) {
                context
                    .read<ShipmentsAddressesCubit>()
                    .selectDropdownShipmentType(val);
              },
              itemAsString: (item) => item.customerDisplayName ?? '',
              hintText: LocaleKeys.shipment_details_select_shipping_type.tr(),
              showSearch: false,
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.fieldRequired.tr();
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }
}
