part of '../../feature_imports.dart';

class FilterAccountDragHandle extends StatelessWidget {
  const FilterAccountDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppSizes.w82,
        height: AppSizes.h8,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(AppSizes.radiusXxxl),
        ),
      ),
    );
  }
}
