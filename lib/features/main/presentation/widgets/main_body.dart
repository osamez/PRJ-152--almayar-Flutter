part of '../features_imports.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, int>(
      builder: (context, selectedIndex) {
        switch (selectedIndex) {
          case 0:
            return const HomeView();
          case 1:
            return const ShipmentsTrackingView();
          case 2:
            return const WalletsView();
          case 3:
            return const ProfileView();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
