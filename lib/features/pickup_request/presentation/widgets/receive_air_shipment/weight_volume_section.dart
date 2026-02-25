part of '../../feature_imports.dart';

class WeightVolumeSection extends StatelessWidget {
  const WeightVolumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.receive_air_total_volume.tr(),
            hintText: LocaleKeys.receive_air_enter_total_volume.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.number,
            titleColor: AppColors.lightHeadingText,
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.receive_air_total_weight.tr(),
            hintText: LocaleKeys.receive_air_enter_total_weight.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.number,
            titleColor: AppColors.lightHeadingText,
          ),
        ),
      ],
    );
  }
}
