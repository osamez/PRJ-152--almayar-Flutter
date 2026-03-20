part of '../../feature_imports.dart';

class AccountStatementFilterHeader extends StatelessWidget {
  const AccountStatementFilterHeader({
    super.key,
    required this.walletId,
  });

  final int walletId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.account_statement_filter_title.tr(),
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.darkText,
              ),
            ),
            verticalSpace(AppSizes.h4),
            BlocSelector<WalletsCubit, WalletsState, int>(
              selector: (state) =>
                  state.getWalletTransactionsState.maybeWhen(
                    data: (transactions) => transactions.length,
                    orElse: () => 0,
                  ),
              builder: (context, resultsCount) {
                return Text(
                  LocaleKeys.account_statement_results_found.tr(
                    namedArgs: {'count': resultsCount.toString()},
                  ),
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w400,
                    color: AppColors.hintColor,
                  ),
                );
              },
            ),
          ],
        ),
        const Spacer(),
        CustomInkWellWidget(
          onTap: () => FilterAccountBottomSheet.show(context, walletId),
          radius: AppSizes.radiusMd,
          padding: const EdgeInsets.all(2),
          child: SvgPicture.asset(
            AppAssets.svgFilter,
            width: AppSizes.w24,
            height: AppSizes.h24,
            colorFilter: const ColorFilter.mode(
              AppColors.darkText,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
