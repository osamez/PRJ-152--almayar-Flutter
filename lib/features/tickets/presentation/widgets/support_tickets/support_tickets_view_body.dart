part of '../../feature_imports.dart';

class SupportTicketsViewBody extends StatelessWidget {
  const SupportTicketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SupportTicketsBlocListener(),
        const SupportTicketsTabBar(),
        verticalSpace(AppSizes.h20),
        const SupportTicketsAddButton(),
        verticalSpace(AppSizes.h16),
        const Expanded(child: SupportTicketsListBlocBuilder()),
      ],
    );
  }
}
