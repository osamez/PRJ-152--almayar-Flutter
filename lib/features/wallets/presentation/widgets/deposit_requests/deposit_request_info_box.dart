part of '../../feature_imports.dart';

class DepositRequestInfoBox extends StatelessWidget {
  const DepositRequestInfoBox({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: AppSizes.w12,
        end: AppSizes.w12,
        top: AppSizes.h12,
        bottom: AppSizes.h12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(color: AppColors.greyScale30, width: AppSizes.w2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyleFactory.create(
              size: 13,
              weight: FontWeight.w700,
              color: AppColors.darkText,
            ),
          ),
          verticalSpace(AppSizes.h8),
          content,
        ],
      ),
    );
  }
}
