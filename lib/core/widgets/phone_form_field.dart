import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:almeyar/core/theme/app_colors.dart';
import 'package:almeyar/core/theme/app_text_style_factory.dart';
import 'package:almeyar/core/utils/app_sizes.dart';
import 'package:almeyar/core/helpers/spacing.dart';
import 'package:almeyar/core/widgets/app_text_form_field.dart';
import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/generated/locale_keys.g.dart';

class PhoneFormField extends StatefulWidget {
  const PhoneFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.validator,
    this.onCountryChanged,
    this.onChanged,
    this.initialCountryCode,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?, String)? validator;
  final void Function(String)? onCountryChanged;
  final void Function(String)? onChanged;
  final String? initialCountryCode;

  @override
  State<PhoneFormField> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends State<PhoneFormField> {
  late String _countryCode;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _countryCode = widget.initialCountryCode ?? '+218';
  }

  @override
  void didUpdateWidget(covariant PhoneFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCountryCode != oldWidget.initialCountryCode) {
      _countryCode = widget.initialCountryCode ?? '+218';
    }
  }

  void _updateErrorState(bool hasError) {
    if (_hasError != hasError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _hasError = hasError;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty) ...[
          Row(
            children: [
              Text(
                widget.title,
                style: AppTextStyleFactory.create(
                  size: 13,
                  weight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              horizontalSpace(AppSizes.w4),
              Text(
                "*",
                style: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          verticalSpace(AppSizes.h8),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          spacing: AppSizes.w4,
          children: [
            Expanded(
              child: AppTextFormField(
                hintText: widget.hintText,
                controller: widget.controller,
                validator: (value) {
                  String? errorMsg;
                  if (widget.validator != null) {
                    errorMsg = widget.validator!(value, _countryCode);
                  } else if (value == null || value.trim().isEmpty) {
                    errorMsg = LocaleKeys.phone_required.tr();
                  } else if (!validateInternationalPhoneNumber(
                    value: value,
                    countryCode: _countryCode,
                  )) {
                    errorMsg = LocaleKeys.phone_not_found_error
                        .tr(); // Fallback for invalid phone
                  }

                  _updateErrorState(errorMsg != null);
                  return errorMsg;
                },
                keyboardType: TextInputType.phone,
                onChanged: widget.onChanged,
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
                border: Border.all(
                  color: _hasError ? Colors.red : AppColors.gray,
                ),
              ),
              child: CountryCodePicker(
                key: ValueKey(widget.initialCountryCode),
                onChanged: (country) {
                  setState(() {
                    _countryCode = country.dialCode ?? '+218';
                  });
                  if (widget.onCountryChanged != null) {
                    widget.onCountryChanged!(_countryCode);
                  }
                },
                initialSelection: widget.initialCountryCode ?? 'LY',
                // favorite: ['+39', 'FR'],
                showCountryOnly: false,
                padding: EdgeInsets.zero,
                showOnlyCountryWhenClosed: false,
                showDropDownButton: false,
                flagDecoration: const BoxDecoration(shape: BoxShape.rectangle),
                flagWidth: 20,
                builder: (countryCode) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Container(
                      //   width: AppSizes.w18,
                      //   height: AppSizes.h12,
                      //   decoration: const BoxDecoration(shape: BoxShape.circle),
                      //   child: Image.asset(
                      //     countryCode!.flagUri!,
                      //     package: 'country_code_picker',
                      //     width: 20,
                      //   ),
                      // ),
                      // horizontalSpace(AppSizes.w12),
                      Text(
                        '\u200E${countryCode!.dialCode ?? ''}',
                        style: AppTextStyleFactory.create(
                          size: 14,
                          weight: FontWeight.w400,
                          color: AppColors.darkBlueText,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
