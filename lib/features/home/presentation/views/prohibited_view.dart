part of '../feature_imports.dart';

class ProhibitedView extends StatelessWidget {
  const ProhibitedView({super.key, required this.type});
  final ProhibitedType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProhibitedCubit>()..getProhibitedData(type),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'المواد المحظورة'),
        body: const ProhibitedViewBody().withPadding(
          vertical: AppSizes.h24,
          horizontal: AppSizes.w20,
        ),
      ),
    );
  }
}
