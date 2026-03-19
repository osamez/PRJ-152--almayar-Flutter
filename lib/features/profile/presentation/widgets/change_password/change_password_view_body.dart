part of '../../feature_imports.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const ChangePasswordBlocListener(),
                verticalSpace(AppSizes.h20),
                PasswordTextFormField(
                  title: LocaleKeys.change_password_current.tr(),
                  hintText: LocaleKeys.password_hint.tr(),
                  controller: _currentPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.change_password_current.tr();
                    }
                    return null;
                  },
                  isRequired: true,
                ),

                verticalSpace(AppSizes.h20),
                PasswordTextFormField(
                  title: LocaleKeys.change_password_new.tr(),
                  hintText: LocaleKeys.password_hint.tr(),
                  controller: _newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.change_password_new.tr();
                    }
                    return null;
                  },
                  isRequired: true,
                ),
                verticalSpace(AppSizes.h20),

                PasswordTextFormField(
                  title: LocaleKeys.change_password_confirm.tr(),
                  hintText: LocaleKeys.password_hint.tr(),
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.change_password_confirm.tr();
                    }
                    if (value != _newPasswordController.text) {
                      return LocaleKeys.passwords_not_matching.tr();
                    }
                    return null;
                  },
                  isRequired: true,
                ),
                verticalSpace(AppSizes.h30),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return ChangePasswordSaveButton(
                      isLoading: state.changePasswordState.isLoading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<ChangePasswordCubit>().updatePassword(
                            currentPassword: _currentPasswordController.text,
                            password: _newPasswordController.text,
                            passwordConfirmation:
                                _confirmPasswordController.text,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
