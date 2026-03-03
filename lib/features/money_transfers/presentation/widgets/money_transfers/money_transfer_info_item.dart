part of '../../feature_imports.dart';

class MoneyTransferInfoItem extends StatelessWidget {
  const MoneyTransferInfoItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: AppSizes.w16,
              height: AppSizes.h16,
              colorFilter: const ColorFilter.mode(
                AppColors.darkText,
                BlendMode.srcIn,
              ),
            ),
            horizontalSpace(AppSizes.w10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyleFactory.create(
                      size: 10,
                      weight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyleFactory.create(
                      size: 10,
                      weight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
