part of '../../feature_imports.dart';

class RequestItemDetailsViewBody extends StatefulWidget {
  const RequestItemDetailsViewBody({super.key, required this.order});
  final DeliveryOrderModel order;

  @override
  State<RequestItemDetailsViewBody> createState() =>
      _RequestItemDetailsViewBodyState();
}

class _RequestItemDetailsViewBodyState
    extends State<RequestItemDetailsViewBody> {
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
          verticalSpace(AppSizes.h24),
          verticalSpace(AppSizes.h20),
          verticalSpace(AppSizes.h20),
          RequestItemDetailsInfoCard(order: widget.order),
          verticalSpace(AppSizes.h20),
          RequestItemDetailsTabBar(
            selectedIndex: _selectedTabIndex,
            onTabChanged: _onTabChanged,
          ),
          verticalSpace(AppSizes.h20),
          _buildTabContent(),
          verticalSpace(AppSizes.h30),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const RequestItemDetailsBasicDataTab();
      case 1:
        return const RequestItemDetailsFinancialDataTab();
      case 2:
        return const RequestItemDetailsBoxesDataTab();
      default:
        return const RequestItemDetailsBasicDataTab();
    }
  }
}
