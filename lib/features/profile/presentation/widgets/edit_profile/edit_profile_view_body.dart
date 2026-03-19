part of '../../feature_imports.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.profileState != current.profileState,
      builder: (context, state) {
        return state.profileState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildContent(context, state, isLoading: true),
          data: (profile) => _buildContent(context, state, profile: profile),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () => context.read<ProfileCubit>().getProfile(),
              ).center;
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () => context.read<ProfileCubit>().getProfile(),
            ).center;
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    ProfileState state, {
    ProfileModel? profile,
    bool isLoading = false,
  }) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Skeletonizer(
            enabled: isLoading,
            child: Column(
              children: [
                const EditProfileUpdateBlocListener(),
                const EditProfileDeleteAccountBlocListener(),
                verticalSpace(AppSizes.h20),
                EditProfileUpdateSection(
                  profile: profile ?? const ProfileModel(),
                ),
                verticalSpace(AppSizes.h30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
