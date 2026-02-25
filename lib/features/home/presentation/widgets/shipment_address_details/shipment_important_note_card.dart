part of '../../feature_imports.dart';

class ShipmentImportantNoteCard extends StatelessWidget {
  const ShipmentImportantNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFFF8E1),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Column(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: const Color(0xffF9A825),
            size: AppSizes.w28,
          ),
          verticalSpace(AppSizes.h8),
          Text(
            LocaleKeys.shipment_details_important_note.tr(),
            style: AppTextStyleFactory.create(
              size: 16,
              weight: FontWeight.w700,
              color: AppColors.darkSlate,
            ),
          ),
          verticalSpace(AppSizes.h8),
          Text(
            LocaleKeys.shipment_details_important_note_desc.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w400,
              color: AppColors.grey42,
            ),
          ),
        ],
      ),
    );
  }
}
