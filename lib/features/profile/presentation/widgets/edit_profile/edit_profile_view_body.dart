part of '../../feature_imports.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              verticalSpace(AppSizes.h20),
              const EditProfileAvatarSection(),
              verticalSpace(AppSizes.h24),
              const EditProfileInfoCard(),
              verticalSpace(AppSizes.h40),
              const EditProfileUpdateSection(),
              verticalSpace(AppSizes.h30),
            ],
          ),
        ),
      ],
    );
  }
}
