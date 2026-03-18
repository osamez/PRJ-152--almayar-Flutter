part of '../../feature_imports.dart';

class MoneyTransfersTabBar extends StatelessWidget {
  const MoneyTransfersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MoneyTransfersCubit, MoneyTransfersState, int>(
      selector: (state) => state.selectedIndex,
      builder: (context, selectedIndex) {
        return Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.money_transfers_new_transfer.tr(),
                onPressed: () =>
                    context.read<MoneyTransfersCubit>().selectTab(0),
                backgroundColor: selectedIndex == 0
                    ? AppColors.orange
                    : AppColors.white,
                textStyle: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.bold,
                  color: selectedIndex == 0
                      ? AppColors.white
                      : AppColors.darkSlate,
                ),
                textColor: selectedIndex == 0
                    ? AppColors.white
                    : AppColors.darkSlate,
              ),
            ),
            horizontalSpace(AppSizes.w8),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.money_transfers_deducted.tr(),
                onPressed: () =>
                    context.read<MoneyTransfersCubit>().selectTab(1),
                textStyle: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.bold,
                  color: selectedIndex == 1
                      ? AppColors.white
                      : AppColors.darkSlate,
                ),
                backgroundColor: selectedIndex == 1
                    ? AppColors.orange
                    : AppColors.white,
                textColor: selectedIndex == 1
                    ? AppColors.white
                    : AppColors.darkSlate,
              ),
            ),
            horizontalSpace(AppSizes.w8),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.money_transfers_completed.tr(),
                onPressed: () =>
                    context.read<MoneyTransfersCubit>().selectTab(2),
                textStyle: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.bold,
                  color: selectedIndex == 2
                      ? AppColors.white
                      : AppColors.darkSlate,
                ),
                backgroundColor: selectedIndex == 2
                    ? AppColors.orange
                    : AppColors.white,
                textColor: selectedIndex == 2
                    ? AppColors.white
                    : AppColors.darkSlate,
              ),
            ),
          ],
        );
      },
    );
  }
}
