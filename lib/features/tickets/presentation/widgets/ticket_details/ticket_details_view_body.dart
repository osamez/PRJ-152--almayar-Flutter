part of '../../feature_imports.dart';

class TicketDetailsViewBody extends StatefulWidget {
  final int ticketId;
  const TicketDetailsViewBody({super.key, required this.ticketId});

  @override
  State<TicketDetailsViewBody> createState() => _TicketDetailsViewBodyState();
}

class _TicketDetailsViewBodyState extends State<TicketDetailsViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TicketDetailsBlocListener(),
        Expanded(
          child: BlocListener<TicketDetailsCubit, TicketDetailsState>(
            listenWhen: (previous, current) {
              final prevReplies =
                  previous.getTicketDetailsState.valueOrNull?.replies?.length ??
                  0;
              final currReplies =
                  current.getTicketDetailsState.valueOrNull?.replies?.length ??
                  0;
              return currReplies > prevReplies;
            },
            listener: (context, state) => _scrollToBottom(),
            child: BlocBuilder<TicketDetailsCubit, TicketDetailsState>(
            buildWhen:
                (previous, current) =>
                    previous.getTicketDetailsState !=
                    current.getTicketDetailsState,
            builder: (context, state) {
              return state.getTicketDetailsState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => _buildContent(context, null, isLoading: true),
                data: (ticket) => _buildContent(context, ticket),
                error:
                    (failure) =>
                        failure.status == LocalStatusCodes.connectionError
                            ? InternetConnectionWidget(
                              onPressed:
                                  () => context
                                      .read<TicketDetailsCubit>()
                                      .getTicketDetails(widget.ticketId),
                            )
                            : CustomErrorWidget(
                              message: failure.message ?? '',
                              onPressed:
                                  () => context
                                      .read<TicketDetailsCubit>()
                                      .getTicketDetails(widget.ticketId),
                            ),
              );
            },
          ),
        ),
      ),
      TicketDetailsReplyInput(ticketId: widget.ticketId),
    ],
  );
}

  Widget _buildContent(
    BuildContext context,
    TicketModel? ticket, {
    bool isLoading = false,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TicketDetailsHeader(ticket: ticket),
            verticalSpace(AppSizes.h16),
            TicketDetailsInfoSection(ticket: ticket),
            verticalSpace(AppSizes.h24),
            TicketDetailsDescriptionCard(
              description: ticket?.description ?? '',
            ),
            verticalSpace(AppSizes.h24),
            TicketDetailsCorrespondenceSection(replies: ticket?.replies ?? []),
          ],
        ),
      ),
    );
  }
}
