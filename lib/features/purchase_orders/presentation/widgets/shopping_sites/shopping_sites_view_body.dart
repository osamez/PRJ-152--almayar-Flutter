part of '../../feature_imports.dart';

class ShoppingSitesViewBody extends StatelessWidget {
  const ShoppingSitesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShoppingSitesSearchBar(),
        verticalSpace(AppSizes.h24),
        Expanded(
          child: BlocBuilder<ShoppingSitesCubit, ShoppingSitesState>(
            buildWhen: (prev, curr) =>
                prev.getShoppingSitesState != curr.getShoppingSitesState ||
                prev.isPaginationLoading != curr.isPaginationLoading ||
                prev.sitesList != curr.sitesList,
            builder: (context, state) {
              return state.getShoppingSitesState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => _buildContent(context, state, isLoading: true),
                data: (data) => _buildContent(context, state),
                error: (failure) {
                  if (failure.status == LocalStatusCodes.connectionError) {
                    return InternetConnectionWidget(
                      onPressed: () =>
                          context.read<ShoppingSitesCubit>().getShoppingSites(),
                    );
                  }
                  return CustomErrorWidget(
                    message: failure.error,
                    onPressed: () =>
                        context.read<ShoppingSitesCubit>().getShoppingSites(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    ShoppingSitesState state, {
    bool isLoading = false,
  }) {
    final dummyList = List.generate(9, (index) => const ShoppingSiteModel());
    return Skeletonizer(
      enabled: isLoading,
      child: ShoppingSitesGrid(
        sites: isLoading ? dummyList : state.sitesList,
        isPaginationLoading: state.isPaginationLoading,
      ),
    );
  }
}
