part of '../../feature_imports.dart';

class ShipmentsTrackingViewBody extends StatelessWidget {
  const ShipmentsTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShipmentsTrackingTabBar(),
        verticalSpace(AppSizes.h20),
        const Expanded(child: ShipmentsTrackingStatusGrid()),
      ],
    );
  }
}
