part of '../../feature_imports.dart';

class ShoppingSitesViewBody extends StatelessWidget {
  const ShoppingSitesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShoppingSitesSearchBar(),
        verticalSpace(AppSizes.h24),
        const Expanded(child: ShoppingSitesGrid()),
      ],
    );
  }
}
