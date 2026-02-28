part of '../../feature_imports.dart';

class ShipmentDetailsInfoRowData {
  const ShipmentDetailsInfoRowData({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;
}

class ShipmentDetailsInfoSection extends StatelessWidget {
  const ShipmentDetailsInfoSection({super.key, required this.rows});

  final List<ShipmentDetailsInfoRowData> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Column(
        children: [
          for (int i = 0; i < rows.length; i++) ...[
            ShipmentDetailsInfoRow(
              label: rows[i].label,
              value: rows[i].value,
              valueColor: rows[i].valueColor,
            ),
            if (i < rows.length - 1)
              const Divider(height: 1, color: AppColors.grey98),
          ],
        ],
      ),
    );
  }
}
