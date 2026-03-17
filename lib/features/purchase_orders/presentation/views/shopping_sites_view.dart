part of '../feature_imports.dart';

class ShoppingSitesView extends StatelessWidget {
  const ShoppingSitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShoppingSitesCubit>()..getShoppingSites(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.shopping_sites_title.tr()),
        backgroundColor: AppColors.offWhite,
        body: const ShoppingSitesViewBody().withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
