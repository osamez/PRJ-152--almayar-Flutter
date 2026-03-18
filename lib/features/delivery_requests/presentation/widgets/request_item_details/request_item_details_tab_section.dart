part of '../../feature_imports.dart';

class RequestItemDetailsTabSection extends StatefulWidget {
  const RequestItemDetailsTabSection({super.key, this.order});

  final DeliveryOrderDetailsModel? order;

  @override
  State<RequestItemDetailsTabSection> createState() =>
      _RequestItemDetailsTabSectionState();
}

class _RequestItemDetailsTabSectionState
    extends State<RequestItemDetailsTabSection> {
  int _selectedTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RequestItemDetailsTabBar(
          selectedIndex: _selectedTabIndex,
          onTabChanged: _onTabChanged,
        ),
        verticalSpace(AppSizes.h20),
        _buildTabContent(),
      ],
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return RequestItemDetailsBasicDataTab(order: widget.order);
      case 1:
        return RequestItemDetailsFinancialDataTab(order: widget.order);
      case 2:
        return RequestItemDetailsBoxesDataTab(order: widget.order);
      default:
        return RequestItemDetailsBasicDataTab(order: widget.order);
    }
  }
}
