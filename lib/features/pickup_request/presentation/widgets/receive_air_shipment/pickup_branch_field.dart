part of '../../feature_imports.dart';

class PickupBranchField extends StatelessWidget {
  const PickupBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      title: LocaleKeys.receive_air_pickup_branch.tr(),
      hintText: LocaleKeys.receive_air_select_branch.tr(),
      validator: (value) => null,
      readOnly: true,
      suffixIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 25,
        color: AppColors.deepViolet,
      ),
    );
  }
}
