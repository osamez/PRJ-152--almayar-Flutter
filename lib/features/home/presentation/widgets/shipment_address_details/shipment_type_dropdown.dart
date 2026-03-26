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
              previous.availableDropdownOptions != current.availableDropdownOptions ||
              previous.selectedDropdownShipmentType != current.selectedDropdownShipmentType,
          builder: (context, state) {
            return CustomDropdownSearchList<String>(
              items: state.availableDropdownOptions,
              initialValue: state.selectedDropdownShipmentType,
              customDropdownBuilder: (context, selectedItem) {
                if (selectedItem == null) return const SizedBox.shrink();
                final text = context.read<ShipmentsAddressesCubit>().getCustomerNameStr(branchDetails);
                return Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyleFactory.create(
                    size: 13,
                    weight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                );
              },
              onChanged: (val) {
                if (val != null) {
                  context.read<ShipmentsAddressesCubit>().selectDropdownShipmentType(val);
                }
              },
              itemAsString: (item) => item,
              hintText: LocaleKeys.shipment_details_select_shipping_type.tr(),
              showSearch: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
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
