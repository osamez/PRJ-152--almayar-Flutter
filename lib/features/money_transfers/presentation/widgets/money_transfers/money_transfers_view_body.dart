part of '../../feature_imports.dart';

class MoneyTransfersViewBody extends StatelessWidget {
  const MoneyTransfersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTransfersCubit, MoneyTransfersState>(
      builder: (context, state) {
        return Column(
          children: [
            const MoneyTransfersTabBar(),
            verticalSpace(AppSizes.h20),
            const MoneyTransfersAddButton(),
            verticalSpace(AppSizes.h20),
            Expanded(
              child: BlocBuilder<MoneyTransfersCubit, MoneyTransfersState>(
                buildWhen: (previous, current) {
                  return previous.moneyTransfersState !=
                      current.moneyTransfersState;
                },
                builder: (context, state) {
                  return state.moneyTransfersState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () {
                      final list = List.generate(
                        5,
                        (index) => const MoneyTransferModel(),
                      );
                      return Skeletonizer(
                        enabled: true,
                        child: MoneyTransferListView(
                          data: list,
                          isLoading: true,
                        ),
                      );
                    },
                    error: (failure) {
                      if (failure.status == LocalStatusCodes.connectionError) {
                        return InternetConnectionWidget(
                          onPressed: () => context
                              .read<MoneyTransfersCubit>()
                              .getMoneyTransfers(),
                        );
                      }
                      return CustomErrorWidget(
                        message: failure.error,
                        onPressed: () => context
                            .read<MoneyTransfersCubit>()
                            .getMoneyTransfers(),
                      );
                    },
                    data: (data) {
                      if (data.isEmpty) {
                        return EmptyWidget(
                          message: LocaleKeys.no_data.tr(),
                          imagePath: AppAssets.animationsEmpty,
                        );
                      }

                      return MoneyTransferListView(data: data, isLoading: true);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
