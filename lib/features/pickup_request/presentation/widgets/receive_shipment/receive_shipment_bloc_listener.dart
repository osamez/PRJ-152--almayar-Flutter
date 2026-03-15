part of '../../feature_imports.dart';

class ReceiveShipmentBlocListener extends StatelessWidget {
  const ReceiveShipmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReceiveShipmentCubit, ReceiveShipmentState>(
      listenWhen: (previous, current) =>
          previous.submitState != current.submitState,
      listener: (context, state) {
        state.submitState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (data) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: data.message ?? '',
            );
            context.pushNamed(Routes.shipmentPickupRequests);
          },
          error: (failure) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: failure.error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
