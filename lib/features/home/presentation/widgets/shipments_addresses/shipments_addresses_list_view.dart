part of '../../feature_imports.dart';

class ShipmentsAddressesListView extends StatelessWidget {
  const ShipmentsAddressesListView({
    super.key,
    required this.filteredBranches,
  });

  final List<BranchModel> filteredBranches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final branch = filteredBranches[index];
        return ShipmentsAddressListItem(branch: branch);
      },
      itemCount: filteredBranches.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
