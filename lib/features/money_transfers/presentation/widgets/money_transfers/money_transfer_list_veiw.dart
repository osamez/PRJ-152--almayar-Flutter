part of '../../feature_imports.dart';

class MoneyTransferListView extends StatefulWidget {
  const MoneyTransferListView({
    super.key,
    required this.data,
    this.isLoading = false,
    this.hasMore = false,
  });
  final List<MoneyTransferModel> data;
  final bool isLoading;
  final bool hasMore;
  @override
  State<MoneyTransferListView> createState() => _MoneyTransferListViewState();
}

class _MoneyTransferListViewState extends State<MoneyTransferListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<MoneyTransfersCubit>().loadMoreTransfers();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.data.length + (widget.hasMore ? 1 : 0),
      separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
      itemBuilder: (BuildContext context, int index) {
        if (index >= widget.data.length) {
          return const Center(child: CircularProgressIndicator());
        }
        final item = widget.data[index];
        return MoneyTransferCard(
          model: item,
          onTap: () {
            context.pushNamed(Routes.moneyTransferDetails, extra: item);
          },
        );
      },
    );
  }
}
