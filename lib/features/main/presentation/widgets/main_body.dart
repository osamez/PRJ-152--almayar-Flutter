part of '../features_imports.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, int>(
      builder: (context, selectedIndex) {
        switch (selectedIndex) {
          case 0:
            return const Center(child: Text("Home"));
          case 1:
            return const Center(child: Text("Orders"));
          case 2:
            return const Center(child: Text("Alerts"));
          case 3:
            return const Center(child: Text("Profile"));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
