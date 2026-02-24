import 'package:almeyar/features/home/presentation/feature_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: HomeViewBody(),
    );
  }
}
