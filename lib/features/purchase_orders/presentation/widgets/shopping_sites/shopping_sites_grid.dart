part of '../../feature_imports.dart';

class ShoppingSitesGrid extends StatefulWidget {
  const ShoppingSitesGrid({
    super.key,
    required this.sites,
    required this.isPaginationLoading,
  });

  final List<ShoppingSiteModel> sites;
  final bool isPaginationLoading;

  @override
  State<ShoppingSitesGrid> createState() => _ShoppingSitesGridState();
}

class _ShoppingSitesGridState extends State<ShoppingSitesGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ShoppingSitesCubit>().loadMoreShoppingSites();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sitesList = widget.sites;
    final listLength = sitesList.isEmpty ? 9 : sitesList.length;

    if (sitesList.isEmpty) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: AppSizes.h500,
          child: EmptyWidget(
            message: LocaleKeys.shipment_pickup_requests_no_requests.tr(),
            imagePath: AppAssets.animationsEmpty,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ShoppingSitesCubit>().getShoppingSites(),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: AppSizes.w16,
                mainAxisSpacing: AppSizes.h16,
                childAspectRatio: calculateGridChildAspectRatio(
                  context: context,
                  cardHeight: 126.h,
                  spacing: AppSizes.w10,
                  crossAxisCount: 3,
                  sectionPadding: AppSizes.w20 * 2,
                ),
              ),
              itemCount: listLength,
              itemBuilder: (context, index) {
                if (sitesList.isEmpty) {
                  return const ShoppingSiteCard(
                    name: 'Mock',
                    logoPath: AppAssets.imagesLogo,
                  );
                }
                final site = sitesList[index];
                return ShoppingSiteCard(
                  name: site.name ?? '',
                  logoPath: site.image ?? AppAssets.imagesLogo,
                );
              },
            ),
          ),
          if (widget.isPaginationLoading)
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.h16),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
