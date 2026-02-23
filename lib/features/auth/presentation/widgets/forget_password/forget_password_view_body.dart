part of '../../feature_imports.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ForgetPasswordHeader().toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        const ForgetPasswordForm(),
      ],
    );
  }
}
