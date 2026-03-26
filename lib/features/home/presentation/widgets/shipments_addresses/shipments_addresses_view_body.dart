part of '../../feature_imports.dart';

class ShipmentsAddressesViewBody extends StatelessWidget {
  const ShipmentsAddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AddressesImageCard(),
          verticalSpace(AppSizes.h32),
          const ShipmentAddressesFilters(),
          verticalSpace(AppSizes.h16),
          AppTextFormField(
            hintText: LocaleKeys.shipments_search_country_hint.tr(),
            isRequired: false,
            validator: (p0) {},
            onChanged: (value) => context
                .read<ShipmentsAddressesCubit>()
                .updateSearchQuery(value),
            suffixIcon: SvgPicture.asset(
              AppAssets.svgSearch,
            ).withPadding(horizontal: AppSizes.w12, vertical: AppSizes.h12),
            title: LocaleKeys.shipments_search_country_title.tr(),
          ),
          verticalSpace(AppSizes.h16),
          BlocBuilder<ShipmentsAddressesCubit, ShipmentsAddressesState>(
            buildWhen: (previous, current) =>
                previous.getAllBranchesState != current.getAllBranchesState,
            builder: (context, state) {
              return state.getAllBranchesState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => _buildContent(context, state, isLoading: true),
                data: (branches) => _buildContent(context, state, branches: branches),
                error: (failure) {
                  if (failure.status == LocalStatusCodes.connectionError) {
                    return InternetConnectionWidget(
                      onPressed: () =>
                          context.read<ShipmentsAddressesCubit>().getAllBranches(),
                    );
                  }
                  return CustomErrorWidget(
                    message: failure.error,
                    onPressed: () =>
                        context.read<ShipmentsAddressesCubit>().getAllBranches(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ShipmentsAddressesState state, {
    List<BranchModel>? branches,
    bool isLoading = false,
  }) {
    final filteredBranches =
        branches ?? List.generate(3, (index) => const BranchModel());

    if (filteredBranches.isEmpty && !isLoading) {
      return EmptyWidget(
        message: LocaleKeys.shipments_no_branches_found.tr(),
        imagePath: AppAssets.animationsEmpty,
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      child: ShipmentsAddressesListView(
          filteredBranches: filteredBranches),
    );
  }
}
