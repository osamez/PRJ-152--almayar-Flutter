part of '../../feature_imports.dart';

class SupportTicketsListBlocBuilder extends StatelessWidget {
  const SupportTicketsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) =>
          previous.getAllTicketsState != current.getAllTicketsState ||
          previous.tickets != current.tickets ||
          previous.hasMore != current.hasMore ||
          previous.isPaginationLoading != current.isPaginationLoading,
      builder: (context, state) {
        return state.getAllTicketsState.when(
          initial: () => _buildList(state, isLoading: true),
          loading: () => _buildList(state, isLoading: true),
          data: (_) {
            if (state.tickets.isEmpty) {
              return const EmptyWidget(
                message:
                    "لا توجد تذاكر دعم فني حالياً. إذا كنت تواجه أي مشكلة، فنحن هنا للمساعدة!",
                imagePath: AppAssets.animationsEmpty,
              );
            }
            return _buildList(state, tickets: state.tickets);
          },
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () => context.read<TicketsCubit>().getAllTickets(),
              );
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () => context.read<TicketsCubit>().getAllTickets(),
            );
          },
        );
      },
    );
  }

  Widget _buildList(
    TicketsState state, {
    List<TicketModel>? tickets,
    bool isLoading = false,
  }) {
    final items = tickets ?? List.generate(5, (_) => const TicketModel());

    return Skeletonizer(
      enabled: isLoading,
      child: SupportTicketsList(
        tickets: items,
        hasMore: state.hasMore,
        isLoading: isLoading,
        isPaginationLoading: state.isPaginationLoading,
      ),
    );
  }
}
