part of '../../feature_imports.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.walletName,
    required this.balance,
  });

  final String walletName;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1,
            blurRadius: AppSizes.h8,
            offset: Offset(0, AppSizes.h2),
          ),
        ],
      ),
      child: CustomInkWellWidget(
        onTap: () {},
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w30,
          vertical: AppSizes.h16,
        ),
        radius: AppSizes.radiusMd,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconRoundedBox(
                  iconPath: AppAssets.svgWalletOutlined,
                  iconColor: AppColors.white,
                  width: AppSizes.w44,
                  backgroundColor: AppColors.orange,
                  iconHeight: AppSizes.h24,
                  iconWidth: AppSizes.w24,
                  height: AppSizes.h44,
                ),
                verticalSpace(AppSizes.h12),
                WalletCardInfo(walletName: walletName, balance: balance),
              ],
            ),
            horizontalSpace(AppSizes.w12),
            const Spacer(),
            CustomRounderArrow(
              width: AppSizes.w36,
              height: AppSizes.h36,
              arrowBackgroundColor: AppColors.orange,
              arrowColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
