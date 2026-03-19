part of '../../feature_imports.dart';

class EditProfileUpdateBlocListener extends StatelessWidget {
  const EditProfileUpdateBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listenWhen: (previous, current) =>
          previous.updateProfileState != current.updateProfileState,
      listener: (context, state) {
        state.updateProfileState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (message) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: message.message!,
            );
            context.read<ProfileCubit>().getProfile();
          },
          error: (failure) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: failure.error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
