import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/details_info_row.dart';

class DetailsInfoCardSection extends StatelessWidget {
  const DetailsInfoCardSection({super.key, required this.rows});

  final List<DetailsInfoRowData> rows;

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
            DetailsInfoRow(
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
