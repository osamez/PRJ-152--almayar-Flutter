part of '../../feature_imports.dart';

class PriceCalculatorViewBody extends StatefulWidget {
  const PriceCalculatorViewBody({super.key});

  @override
  State<PriceCalculatorViewBody> createState() =>
      _PriceCalculatorViewBodyState();
}

class _PriceCalculatorViewBodyState extends State<PriceCalculatorViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PriceCalculatorCubit>().loadInitialData();
  }

  @override
  void dispose() {
    _weightController.dispose();
    _volumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceCalculatorCubit, PriceCalculatorState>(
      builder: (context, state) {
        if (state.isErrorInitial) {
          return CustomErrorWidget(
            message: state.errorInitial?.message ?? '',
            onPressed: () =>
                context.read<PriceCalculatorCubit>().loadInitialData(),
          ).center;
        }

        return Skeletonizer(
          enabled: state.isLoadingInitial,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w20,
              vertical: AppSizes.h24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriceCalculatorShippingTypeSection(
                    isSeaShipping: state.shipmentType == 'sea',
                    onSeaSelected: () => context
                        .read<PriceCalculatorCubit>()
                        .updateShipmentType('sea'),
                    onAirSelected: () => context
                        .read<PriceCalculatorCubit>()
                        .updateShipmentType('air'),
                  ),
                  verticalSpace(AppSizes.h20),
                  PriceCalculatorShippingMethodSection(
                    isSeaShipping: state.shipmentType == 'sea',
                    isPrimarySelected: state.flightType == 'fast',
                    onPrimarySelected: () => context
                        .read<PriceCalculatorCubit>()
                        .updateFlightType('fast'),
                    onSecondarySelected: () => context
                        .read<PriceCalculatorCubit>()
                        .updateFlightType('slow'),
                  ),
                  verticalSpace(AppSizes.h20),
                  const PriceCalculatorPickupBranchField(),
                  verticalSpace(AppSizes.h16),
                  const PriceCalculatorDeliveryBranchField(),
                  verticalSpace(AppSizes.h16),
                  const PriceCalculatorClassificationField(),
                  verticalSpace(AppSizes.h24),
                  Center(
                    child: Skeleton.leaf(
                      child: Image.asset(
                        AppAssets.imagesBoxes,
                        height: AppSizes.h150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  verticalSpace(AppSizes.h16),
                  PriceCalculatorWeightVolumeSection(
                    weightController: _weightController,
                    volumeController: _volumeController,
                  ),
                  verticalSpace(AppSizes.h32),
                  AppElevatedButton(
                    text: LocaleKeys.price_calculator_calculate_button.tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<PriceCalculatorCubit>().calculatePrice();
                      }
                    },
                  ),
                  verticalSpace(AppSizes.h20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
