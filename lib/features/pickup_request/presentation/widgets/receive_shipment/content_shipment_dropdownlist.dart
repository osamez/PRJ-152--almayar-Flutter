part of '../../feature_imports.dart';

class ShipmentContentsDropdownList extends StatelessWidget {
  const ShipmentContentsDropdownList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveShipmentCubit, ReceiveShipmentState>(
      buildWhen: (p, c) =>
          p.contentsState != c.contentsState ||
          p.selectedContent != c.selectedContent,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.receive_shipment_contents.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h10),
            CustomDropdownSearchList<ShipmentContentModel>(
              hintText: LocaleKeys.receive_shipment_select_from_list.tr(),
              items: state.contentsState.valueOrNull ?? [],
              initialValue: state.selectedContent,
              itemAsString: (content) => content.name ?? '',
              onChanged: (content) =>
                  context.read<ReceiveShipmentCubit>().updateContent(content),
              validator: (value) => value == null
                  ? LocaleKeys.receive_shipment_select_from_list.tr()
                  : null,
            ),
          ],
        );
      },
    );
  }
}
