import 'package:almeyar/core/utils/exports.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.showLabel = false,
    this.titleColor,
    this.focusedBorder,
    this.enabledBorder,
    this.onChanged,
    this.inputTextStyle,
    this.prefixIcon,
    required this.hintText,
    this.inputFormatters,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.onSaved,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.title,
    this.error,
    this.borderColor,
    this.radius,
    this.onFieldSubmitted,
    this.textInputAction,
    this.showFocusedBorder = false,
    this.height,
    this.isEnabled = true,
    this.isRequired = true,
    this.focusNode,
    this.autovalidateMode,
    this.showResetPassword = false,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? title;
  final String? error;
  final Color? borderColor;
  final double? radius;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool showFocusedBorder;
  final Color? titleColor;
  final bool? showLabel;
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final bool isEnabled;
  final bool isRequired;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final bool showResetPassword;

  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && showLabel == false) ...[
          Row(
            children: [
              Text(
                title ?? "",
                style: AppTextStyleFactory.create(
                  size: 13,
                  weight: FontWeight.w500,
                  color: titleColor ?? AppColors.black,
                ),
              ),
              if (isRequired) ...[
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
              if (showResetPassword) ...[
                const Spacer(),
                Text(
                  "نسيت كلمة المرور؟",
                  style: AppTextStyleFactory.create(
                    size: 13,
                    weight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
              ],
            ],
          ),
          verticalSpace(AppSizes.h8),
        ],
        SizedBox(
          height: height,
          child: TextFormField(
            readOnly: readOnly,
            onSaved: onSaved,
            textAlign: textAlign,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            inputFormatters: inputFormatters,
            focusNode: focusNode,
            cursorColor: AppColors.orange,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            enabled: isEnabled,
            validator: (value) => validator(value),
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: isObscureText ?? false,
            maxLines: maxLines,
            maxLength: maxLength,
            autovalidateMode:
                autovalidateMode ?? AutovalidateMode.onUserInteraction,
            style:
                inputTextStyle ??
                AppTextStyleFactory.create(
                  size: 13,
                  weight: FontWeight.w400,
                  color: AppColors.black,
                ),
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              suffixIcon: suffixIcon,
              floatingLabelBehavior: FloatingLabelBehavior.always,

              prefixIcon: prefixIcon,
              fillColor: backgroundColor ?? AppColors.white,
              filled: true,
              // label: title != null && showLabel == true
              //     ? Text(
              //         title!,
              //         style: AppTextStyles.reg14.copyWith(
              //           color: titleColor ?? AppColors.black,
              //         ),
              //       )
              //     : null,
              hintStyle:
                  hintStyle ??
                  AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w300,
                    color: AppColors.hintColor,
                  ),
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: AppSizes.w16,
                    vertical: AppSizes.h12,
                  ),
              border: _buildBorder(),
              enabledBorder: enabledBorder ?? _buildBorder(),
              focusedBorder:
                  focusedBorder ??
                  _buildBorder(
                    color: showFocusedBorder ? AppColors.gray : null,
                  ),
              errorBorder: _buildErrorBorder(),
              focusedErrorBorder: _buildErrorBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? AppSizes.radiusSm),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? AppSizes.radiusSm),
      borderSide: BorderSide(
        color: color ?? borderColor ?? AppColors.gray,
        width: 1,
      ),
    );
  }
}
