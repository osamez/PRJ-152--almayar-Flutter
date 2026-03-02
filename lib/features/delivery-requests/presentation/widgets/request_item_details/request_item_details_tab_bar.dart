part of '../../feature_imports.dart';

class RequestItemDetailsTabBar extends StatelessWidget {
  const RequestItemDetailsTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RequestItemDetailsTabItem(
            label: LocaleKeys.delivery_request_details_basic_data_tab.tr(),
            isSelected: selectedIndex == 0,
            onTap: () => onTabChanged(0),
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Expanded(
          child: RequestItemDetailsTabItem(
            label: LocaleKeys.delivery_request_details_financial_data_tab.tr(),
            isSelected: selectedIndex == 1,
            onTap: () => onTabChanged(1),
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Expanded(
          child: RequestItemDetailsTabItem(
            label: LocaleKeys.delivery_request_details_boxes_data_tab.tr(),
            isSelected: selectedIndex == 2,
            onTap: () => onTabChanged(2),
          ),
        ),
      ],
    );
  }
}
