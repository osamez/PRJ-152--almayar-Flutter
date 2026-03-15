part of '../../feature_imports.dart';

class PickupBranchField extends StatelessWidget {
  const PickupBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveShipmentCubit, ReceiveShipmentState>(
      buildWhen: (p, c) =>
          p.receivingBranchesState != c.receivingBranchesState ||
          p.selectedPickupBranch != c.selectedPickupBranch,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.receive_shipment_pickup_branch.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h10),
            CustomDropdownSearchList<AppBranchModel>(
              hintText: LocaleKeys.receive_shipment_select_branch.tr(),
              items: state.receivingBranchesState.valueOrNull ?? [],
              initialValue: state.selectedPickupBranch,
              itemAsString: (branch) => branch.name ?? '',
              onChanged: (branch) =>
                  context.read<ReceiveShipmentCubit>().updatePickupBranch(branch),
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
