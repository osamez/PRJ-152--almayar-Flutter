part of '../feature_imports.dart';

class AddNewTicketView extends StatelessWidget {
  const AddNewTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddNewTicketCubit>()..loadInitialData(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.support_tickets_title.tr()),
        body: const Stack(
          children: [
            AddNewTicketBlocListener(),
            AddNewTicketViewBody(),
          ],
        ).withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
