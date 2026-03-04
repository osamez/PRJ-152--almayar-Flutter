part of '../../feature_imports.dart';

class SupportTicketsTabBar extends StatelessWidget {
  const SupportTicketsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) =>
          previous.selectedTab != current.selectedTab,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: SupportTicketsTabItem(
                label: LocaleKeys.support_tickets_open.tr(),
                isSelected: state.selectedTab == TicketTabType.open,
                onTap: () =>
                    context.read<TicketsCubit>().changeTab(TicketTabType.open),
              ),
            ),
            horizontalSpace(AppSizes.w8),
            Expanded(
              child: SupportTicketsTabItem(
                label: LocaleKeys.support_tickets_pending.tr(),
                isSelected: state.selectedTab == TicketTabType.pending,
                onTap: () => context.read<TicketsCubit>().changeTab(
                  TicketTabType.pending,
                ),
              ),
            ),
            horizontalSpace(AppSizes.w8),
            Expanded(
              child: SupportTicketsTabItem(
                label: LocaleKeys.support_tickets_closed.tr(),
                isSelected: state.selectedTab == TicketTabType.closed,
                onTap: () => context.read<TicketsCubit>().changeTab(
                  TicketTabType.closed,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
