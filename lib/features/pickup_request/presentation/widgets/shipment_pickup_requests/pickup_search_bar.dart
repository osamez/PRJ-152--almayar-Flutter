part of '../../feature_imports.dart';

class PickupSearchBar extends StatefulWidget {
  const PickupSearchBar({super.key});

  @override
  State<PickupSearchBar> createState() => _PickupSearchBarState();
}

class _PickupSearchBarState extends State<PickupSearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.pickup_requests_search_hint.tr(),
      suffixIcon: SvgPicture.asset(
        AppAssets.svgBarcode2,
      ).withPadding(vertical: AppSizes.w12, horizontal: AppSizes.w12),
      validator: (value) => null,
      onChanged: (value) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 800), () {
          context.read<ShipmentPickupRequestsCubit>().searchByTrackingNumber(
            value,
          );
        });
      },
    );
  }
}
