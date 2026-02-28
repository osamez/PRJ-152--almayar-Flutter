part of '../../feature_imports.dart';

class ShipmentDetailsViewBody extends StatefulWidget {
  const ShipmentDetailsViewBody({super.key});

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
          const ShipmentDetailsHeaderCard(
            shipmentCode: 'SEA-888-TIP-F-4852-GU',
            statusLabel: '',
            date: '2026-01-01',
            shippingType: '',
            originWarehouse: 'مخزن جوانزو',
            originCountry: 'الصين',
            destinationWarehouse: 'مخزن طرابلس',
            destinationCountry: 'ليبيا',
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
        return const ShipmentDetailsBasicDataTab();
      case 1:
        return const ShipmentDetailsFinancialDataTab();
      case 2:
        return const ShipmentDetailsBoxesDataTab();
      default:
        return const ShipmentDetailsBasicDataTab();
    }
  }
}
