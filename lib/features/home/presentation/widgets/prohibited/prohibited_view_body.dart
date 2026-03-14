part of '../../feature_imports.dart';

class ProhibitedViewBody extends StatelessWidget {
  const ProhibitedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProhibitedCubit, ProhibitedState>(
      buildWhen: (previous, current) =>
          previous.fetchProhibitedDataState != current.fetchProhibitedDataState,
      builder: (context, state) {
        return state.fetchProhibitedDataState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CupertinoActivityIndicator()),
          data: (prohibited) {
            return SingleChildScrollView(
              child: Html(data: prohibited.data ?? ''),
            );
          },
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () {
                  final type =
                      (context.findAncestorWidgetOfExactType<ProhibitedView>()!)
                          .type;
                  context.read<ProhibitedCubit>().getProhibitedData(type);
                },
              );
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () {
                final type =
                    (context.findAncestorWidgetOfExactType<ProhibitedView>()!)
                        .type;
                context.read<ProhibitedCubit>().getProhibitedData(type);
              },
            );
          },
        );
      },
    );
  }
}
