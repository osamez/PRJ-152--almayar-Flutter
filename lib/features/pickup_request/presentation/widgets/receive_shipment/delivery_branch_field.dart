part of '../../feature_imports.dart';

class DeliveryBranchField extends StatelessWidget {
  const DeliveryBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveShipmentCubit, ReceiveShipmentState>(
      buildWhen: (p, c) =>
          p.deliveryBranchesState != c.deliveryBranchesState ||
          p.selectedDeliveryBranch != c.selectedDeliveryBranch,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.receive_shipment_delivery_branch.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h10),
            CustomDropdownSearchList<AppBranchModel>(
              hintText: LocaleKeys.receive_shipment_select_branch.tr(),
              items: state.deliveryBranchesState.valueOrNull ?? [],
              initialValue: state.selectedDeliveryBranch,
              itemAsString: (branch) => branch.name ?? '',
              onChanged: (branch) =>
                  context.read<ReceiveShipmentCubit>().updateDeliveryBranch(branch),
              validator: (value) => value == null
                  ? LocaleKeys.receive_shipment_select_branch.tr()
                  : null,
            ),
          ],
        );
      },
    );
  }
}
