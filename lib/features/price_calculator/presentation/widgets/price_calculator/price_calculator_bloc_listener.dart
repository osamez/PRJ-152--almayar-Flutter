part of '../../feature_imports.dart';

class PriceCalculatorBlocListener extends StatelessWidget {
  const PriceCalculatorBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PriceCalculatorCubit, PriceCalculatorState>(
      listenWhen: (previous, current) =>
          previous.calculationResult != current.calculationResult,
      listener: (context, state) {
        state.calculationResult.whenOrNull(
          loading: () => LoadingDialog.show(context),
          error: (failure) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: failure.message ?? '',
            );
          },
          data: (result) {
            LoadingDialog.hide(context);
            PriceCalculatorResultBottomSheet.show(
              context,
              costPerKg: result.pricePerUnit.toString(),
              totalCost: result.estimatedPrice.toString(),
              shipmentType: state.shipmentType,
            );
          },
        );
      },
      child: child,
    );
  }
}
