part of '../../feature_imports.dart';

enum TransactionType { collection, disbursement }

class AccountStatementTransactionCard extends StatelessWidget {
  const AccountStatementTransactionCard({
    super.key,
    required this.type,
    required this.amount,
    required this.currencyKey,
    required this.date,
    required this.description,
    required this.balanceAfter,
  });

  final TransactionType type;
  final String amount;
  final String currencyKey;
  final String date;
  final String description;
  final String balanceAfter;

  bool get _isCollection => type == TransactionType.collection;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h12,
        ),
        width: double.infinity,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            verticalSpace(AppSizes.h12),
            Divider(color: AppColors.grey97, height: AppSizes.h2),
            verticalSpace(AppSizes.h12),
            _buildDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CustomIconRoundedBox(
          iconPath: _isCollection
              ? AppAssets.svgTrendUp
              : AppAssets.svgTrendDown,
          iconColor: _isCollection ? AppColors.green : AppColors.orange,
          backgroundColor: _isCollection ? AppColors.greenBg : AppColors.redBg,
          width: AppSizes.w44,
          height: AppSizes.h44,
          iconWidth: AppSizes.w32,
          iconHeight: AppSizes.h32,
        ),
        horizontalSpace(AppSizes.w12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isCollection
                  ? LocaleKeys.account_statement_collection.tr()
                  : LocaleKeys.account_statement_disbursement.tr(),
              style: AppTextStyleFactory.create(
                size: 12,
                weight: FontWeight.w700,
                color: AppColors.darkText,
              ),
            ),
            verticalSpace(AppSizes.h4),
            IconTextRow(
              iconPath: AppAssets.svgCalendar,
              text: date,
              textColor: AppColors.darkSlate,
              iconColor: AppColors.darkSlate,
              textWeight: FontWeight.w700,
            ),
          ],
        ),
        const Spacer(),

        Text(
          '$amount ${currencyKey.tr()}',
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h8),
        Text(
          balanceAfter,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}
