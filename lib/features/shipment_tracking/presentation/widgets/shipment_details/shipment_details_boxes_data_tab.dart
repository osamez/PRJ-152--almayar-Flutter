part of '../../feature_imports.dart';

class ShipmentDetailsBoxesDataTab extends StatelessWidget {
  const ShipmentDetailsBoxesDataTab({super.key, required this.shipment});

  final ShipmentModel shipment;

  @override
  Widget build(BuildContext context) {
    return shipment.boxes == null || shipment.boxes!.isEmpty
        ? Center(
            child: Text(
              "لا توجد صناديق",
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w500,
                color: AppColors.gray,
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShipmentDetailsSectionTitle(
                title: LocaleKeys.shipment_details_boxes_data_tab.tr(),
              ),
              verticalSpace(AppSizes.h20),
              ListView.separated(
                itemCount: shipment.boxes!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    verticalSpace(AppSizes.h16),
                itemBuilder: (context, index) {
                  final box = shipment.boxes![index];
                  return ShipmentDetailsBoxCard(shipment: shipment, box: box);
                },
              ),
            ],
          );
  }
}
