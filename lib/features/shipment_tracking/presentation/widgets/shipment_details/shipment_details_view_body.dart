part of '../../feature_imports.dart';

class ShipmentDetailsViewBody extends StatefulWidget {
  const ShipmentDetailsViewBody({super.key, required this.shipmentModel});
  final ShipmentModel shipmentModel;

  @override
  State<ShipmentDetailsViewBody> createState() =>
      _ShipmentDetailsViewBodyState();
}

class _ShipmentDetailsViewBodyState extends State<ShipmentDetailsViewBody> {
  int _selectedTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ShipmentDetailsHeaderCard(
            shipmentCode: widget.shipmentModel.code ?? '',
            status: widget.shipmentModel.status!,
            date: formatDateFromApi(widget.shipmentModel.createdAt ?? ''),
            shippingType: widget.shipmentModel.shipmentType ?? '',
            originWarehouse: widget.shipmentModel.deliveryBranch ?? '',
            originCountry: widget.shipmentModel.deliveryBranch ?? '',
            destinationWarehouse: widget.shipmentModel.receivingBranch ?? '',
            destinationCountry: widget.shipmentModel.receivingBranch ?? '',
          ),
          verticalSpace(AppSizes.h30),
          ShipmentDetailsTabBar(
            selectedIndex: _selectedTabIndex,
            onTabChanged: _onTabChanged,
          ),
          verticalSpace(AppSizes.h20),
          _buildTabContent(),
          verticalSpace(AppSizes.h30),
        ],
      ).withPadding(bottom: AppSizes.h24, top: AppSizes.h24),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return ShipmentDetailsBasicDataTab(shipment: widget.shipmentModel);
      case 1:
        return ShipmentDetailsFinancialDataTab(shipment: widget.shipmentModel);
      case 2:
        return ShipmentDetailsBoxesDataTab(shipment: widget.shipmentModel);
      default:
        return ShipmentDetailsBasicDataTab(shipment: widget.shipmentModel);
    }
  }
}
