part of '../../feature_imports.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<RegisterCubit>().getCountryLocations();
    context.read<RegisterCubit>().getReceivingBranches();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.getLocationsState != current.getLocationsState,
      builder: (context, state) {
        return Skeletonizer(
          enabled: state.getLocationsState.isLoading,
          child: CustomScrollView(
            slivers: [
              Column(
                children: [
                  const RegisterBlocListener(),
                  AuthHeader(title: LocaleKeys.open_new_account.tr()),
                  verticalSpace(AppSizes.h16),
                  const RegisterStepIndicator(),
                ],
              )
                  .withPadding(top: AppSizes.h56, horizontal: AppSizes.w20)
                  .toSliver,
              verticalSpace(AppSizes.h24).toSliver,
              const RegisterForm(),
            ],
          ),
        );
      },
    );
  }
}
