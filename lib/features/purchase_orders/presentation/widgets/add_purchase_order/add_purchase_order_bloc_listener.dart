part of '../../feature_imports.dart';

class AddPurchaseOrderBlocListener extends StatelessWidget {
  const AddPurchaseOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPurchaseOrderCubit, AddPurchaseOrderState>(
      listenWhen: (previous, current) =>
          previous.addPurchaseRequestState != current.addPurchaseRequestState,
      listener: (context, state) {
        state.addPurchaseRequestState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (message) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: message.message ?? '',
            );
            Navigator.pop(context, true);
            context.read<PurchaseOrdersCubit>().getPurchaseRequests(
                  isRefresh: true,
                );
          },
          error: (error) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: error.error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
