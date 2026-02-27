part of '../../feature_imports.dart';

class DetailsInfoSection extends StatelessWidget {
  const DetailsInfoSection({
    super.key,
    required this.trackingCode,
    required this.supplierPhone,
    required this.classification,
    required this.contents,
  });

  final String trackingCode;
  final String supplierPhone;
  final String classification;
  final String contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha: 0.04),
        //     blurRadius: 8,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          InfoRow(
            label: LocaleKeys.shipment_details_tracking_code.tr(),
            value: trackingCode,
          ),
          _buildDivider(),
          InfoRow(
            label: LocaleKeys.shipment_details_supplier_phone.tr(),
            value: supplierPhone,
          ),
          _buildDivider(),
          InfoRow(
            label: LocaleKeys.shipment_details_classification.tr(),
            value: classification,
          ),
          _buildDivider(),
          InfoRow(
            label: LocaleKeys.shipment_details_contents.tr(),
            value: contents,
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() => const Divider(height: 1, color: AppColors.grey98);
}
