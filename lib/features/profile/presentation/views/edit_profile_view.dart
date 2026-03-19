part of '../feature_imports.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProfileCubit>()..getProfile()),
        BlocProvider(create: (context) => getIt<UpdateProfileCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.edit_profile_title.tr()),
        backgroundColor: AppColors.offWhite,
        body: const EditProfileViewBody().withPadding(
          vertical: AppSizes.h24,
          horizontal: AppSizes.w20,
        ),
      ),
    );
  }
}
