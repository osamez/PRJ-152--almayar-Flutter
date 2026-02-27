part of '../../feature_imports.dart';

class DetailsNoteCard extends StatelessWidget {
  const DetailsNoteCard({super.key, required this.note});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h14,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: LocaleKeys.shipment_details_inspection_note.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            TextSpan(
              text: ' $note ',
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.darkSlate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
