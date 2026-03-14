part of '../../feature_imports.dart';

class ShipmentAddressDetailsViewBody extends StatefulWidget {
  const ShipmentAddressDetailsViewBody({super.key, required this.branchId});

  final int branchId;

  @override
  State<ShipmentAddressDetailsViewBody> createState() =>
      _ShipmentAddressDetailsViewBodyState();
}

class _ShipmentAddressDetailsViewBodyState
    extends State<ShipmentAddressDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ShipmentsAddressesCubit>().showBranchDetails(widget.branchId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentsAddressesCubit, ShipmentsAddressesState>(
      buildWhen: (previous, current) =>
          previous.showBranchDetailsState != current.showBranchDetailsState,
      builder: (context, state) {
        return state.showBranchDetailsState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildContent(context, null, isLoading: true),
          data: (data) => _buildContent(context, data),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () => context
                    .read<ShipmentsAddressesCubit>()
                    .showBranchDetails(widget.branchId),
              );
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () => context
                  .read<ShipmentsAddressesCubit>()
                  .showBranchDetails(widget.branchId),
            );
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    BranchDetailsModel? data, {
    bool isLoading = false,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
        child: Column(
          children: [
            ShipmentDetailsCountryCard(
              arabicName: data?.name ?? 'Loading...',
              englishName: data?.countryName ?? 'Loading...',
              flagAsset: AppAssets.svgFlagTest,
            ),
            verticalSpace(AppSizes.h16),
            const ShipmentImportantNoteCard(),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_shipping_type.tr(),
              value:
                  data?.availableShippingWays
                      ?.map((way) => way.name ?? '')
                      .where((name) => name.isNotEmpty)
                      .join(', ') ??
                  '',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_customer_name.tr(),
              value: data?.name ?? 'Mock Name',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_main_address.tr(),
              value: data?.address1 ?? 'Mock Address 1',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_sub_address.tr(),
              value: data?.address2 ?? 'Mock Address 2',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_city.tr(),
              value: data?.cityName ?? 'Mock City',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_region.tr(),
              value: data?.state ?? 'Mock State',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_postal_code.tr(),
              value: data?.postalCode ?? 'Mock Postal Code',
            ),
            verticalSpace(AppSizes.h16),
            ShipmentInfoCopyRow(
              label: LocaleKeys.shipment_details_phone_number.tr(),
              value: data?.phone ?? 'Mock Phone',
            ),
            verticalSpace(AppSizes.h24),
            AppElevatedButton(
              text: LocaleKeys.shipment_details_copy_all.tr(),
              onPressed: isLoading
                  ? null
                  : () => _copyAllToClipboard(context, data!),
            ),
            verticalSpace(AppSizes.h16),
          ],
        ),
      ),
    );
  }

  void _copyAllToClipboard(BuildContext context, BranchDetailsModel data) {
    final allText =
        '${data.availableShippingWays?.map((way) => way.name ?? '').join(', ')}\n'
        '${data.name}\n'
        '${data.address1}\n'
        '${data.address2}\n'
        '${data.cityName}\n'
        '${data.state}\n'
        '${data.postalCode}\n'
        '${data.phone}';
    Clipboard.setData(ClipboardData(text: allText));
    showAppSnackbar(
      context: context,
      type: SnackbarType.success,
      description: LocaleKeys.shipment_details_copy_all.tr(),
    );
  }
}
