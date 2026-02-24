part of '../features_imports.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MainViewBodyContent(),
    );
  }
}

class MainViewBodyContent extends StatelessWidget {
  const MainViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MainBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.orange,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
