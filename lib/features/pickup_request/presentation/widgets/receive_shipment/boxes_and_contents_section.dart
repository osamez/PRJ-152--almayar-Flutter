part of '../../feature_imports.dart';

class BoxesAndContentsSection extends StatelessWidget {
  const BoxesAndContentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: LocaleKeys.receive_shipment_select_from_list.tr(),
            validator: (value) => null,
            readOnly: true,
            title: LocaleKeys.receive_shipment_boxes_count.tr(),

            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 25,
              color: AppColors.white,
            ),
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Expanded(
          child: AppTextFormField(
            hintText: LocaleKeys.receive_shipment_enter_boxes_count.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.number,
            title: LocaleKeys.receive_shipment_contents.tr(),
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 25,
              color: AppColors.deepViolet,
            ),
          ),
        ),
      ],
    );
  }
}
