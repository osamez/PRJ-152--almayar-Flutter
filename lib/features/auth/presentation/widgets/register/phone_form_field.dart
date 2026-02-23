part of '../../feature_imports.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required this.title,
    required this.hintText,
  });

  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      spacing: AppSizes.w4,
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: hintText,
            validator: (value) {},
            title: title,
            keyboardType: TextInputType.phone,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w12,
            vertical: AppSizes.h12,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            border: Border.all(color: AppColors.gray),
          ),
          child: Center(
            child: Text(
              LocaleKeys.country_code.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w300,
                color: AppColors.darkBlueText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
