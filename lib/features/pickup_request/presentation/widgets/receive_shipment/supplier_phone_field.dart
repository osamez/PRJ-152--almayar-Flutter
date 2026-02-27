part of '../../feature_imports.dart';

class SupplierPhoneField extends StatelessWidget {
  const SupplierPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.receive_shipment_supplier_phone.tr(),
            hintText: LocaleKeys.enter_phone_number.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.phone,
          ),
        ),
        horizontalSpace(AppSizes.w4),
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
          child: Text(
            LocaleKeys.country_code.tr(),
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
