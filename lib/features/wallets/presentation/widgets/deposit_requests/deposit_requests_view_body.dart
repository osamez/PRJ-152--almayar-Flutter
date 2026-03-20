part of '../../feature_imports.dart';

class DepositRequestsViewBody extends StatelessWidget {
  const DepositRequestsViewBody({super.key});

  static const double _paginationScrollThreshold = 200;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositRequestsCubit, DepositRequestsState>(
      buildWhen: (previous, current) =>
          previous.isLoadingInitial != current.isLoadingInitial ||
          previous.isErrorInitial != current.isErrorInitial ||
          previous.getDepositsState != current.getDepositsState ||
          previous.depositsList != current.depositsList ||
          previous.isDepositsPaginationLoading !=
              current.isDepositsPaginationLoading ||
          previous.depositsHasMore != current.depositsHasMore,
      builder: (context, state) {
        if (state.isErrorInitial) {
          final failure = state.errorInitial;
          if (failure?.status == LocalStatusCodes.connectionError) {
            return InternetConnectionWidget(
              onPressed: () =>
                  context.read<DepositRequestsCubit>().loadInitialData(),
            ).center;
          }
          return CustomErrorWidget(
            message: failure?.error ?? '',
            onPressed: () =>
                context.read<DepositRequestsCubit>().loadInitialData(),
          ).center;
        }

        return state.getDepositsState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildContent(context, state, isLoading: true),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () =>
                    context.read<DepositRequestsCubit>().loadInitialData(),
              ).center;
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () =>
                  context.read<DepositRequestsCubit>().loadInitialData(),
            ).center;
          },
          data: (_) {
            if (state.deposits.isEmpty) {
              return EmptyWidget(
                message: LocaleKeys.no_data.tr(),
                imagePath: AppAssets.animationsEmpty,
              ).center;
            }
            return _buildContent(context, state);
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    DepositRequestsState state, {
    bool isLoading = false,
  }) {
    final displayDeposits = isLoading
        ? const <DepositModel>[
            DepositModel(amount: '0', createdAt: ''),
            DepositModel(amount: '0', createdAt: ''),
            DepositModel(amount: '0', createdAt: ''),
          ]
        : state.deposits;

    final showPaginationLoader =
        !isLoading && state.isDepositsPaginationLoading;
    final itemCount = displayDeposits.length + (showPaginationLoader ? 1 : 0);

    return Skeletonizer(
      enabled: isLoading || state.isLoadingInitial,
      child: Column(
        children: [
          const DepositRequestsBlocListener(),
          const CreateDepositRequestButton(),
          verticalSpace(AppSizes.h24),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await context.read<DepositRequestsCubit>().loadInitialData();
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (isLoading) return false;
                  final maxScroll = notification.metrics.maxScrollExtent;
                  final currentScroll = notification.metrics.pixels;
                  if (currentScroll >=
                      (maxScroll - _paginationScrollThreshold)) {
                    context.read<DepositRequestsCubit>().loadMoreDeposits();
                  }
                  return false;
                },
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    if (index >= displayDeposits.length) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSizes.h12),
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                    return DepositRequestCard(deposit: displayDeposits[index]);
                  },
                  separatorBuilder: (context, index) =>
                      verticalSpace(AppSizes.h16),
                  itemCount: itemCount,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
