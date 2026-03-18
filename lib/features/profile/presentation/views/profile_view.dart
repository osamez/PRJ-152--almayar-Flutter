part of '../feature_imports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: const Scaffold(
        backgroundColor: AppColors.offWhite,
        body: ProfileViewBody(),
      ),
    );
  }
}
