part of '../../feature_imports.dart';

class DepositRequestsHeader extends StatelessWidget {
  const DepositRequestsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.h52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            LocaleKeys.deposit_requests_title.tr(),
            style: AppTextStyleFactory.create(
              size: 18,
              weight: FontWeight.w700,
              color: AppColors.blue34,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CustomInkWellWidget(
              radius: AppSizes.radiusMd,
              onTap: () => context.pop(),
              child: Container(
                width: AppSizes.w52,
                height: AppSizes.h52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: AppSizes.h18,
                  color: AppColors.blue34,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
