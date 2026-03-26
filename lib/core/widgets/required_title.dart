import 'package:almeyar/core/utils/exports.dart';

class RequiredTitle extends StatelessWidget {
  const RequiredTitle({
    super.key,
    this.title,
    this.titleColor,
    this.isRequired = true,
    this.showResetPassword,
  });
  final String? title;
  final Color? titleColor;
  final bool isRequired;
  final bool? showResetPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
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
      ],
    );
  }
}
