part of '../../feature_imports.dart';

//
class PurchaseOrdersSearchBar extends StatefulWidget {
  const PurchaseOrdersSearchBar({super.key});

  @override
  State<PurchaseOrdersSearchBar> createState() => _PurchaseOrdersSearchBarState();
}

class _PurchaseOrdersSearchBarState extends State<PurchaseOrdersSearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.purchase_orders_search_hint.tr(),
      onChanged: (value) {
        _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          if (context.mounted) {
            context.read<PurchaseOrdersCubit>().search(value);
          }
        });
      },
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w12,
          vertical: AppSizes.h12,
        ),
        child: SvgPicture.asset(
          AppAssets.svgSearch,
          width: AppSizes.w20,
          height: AppSizes.h20,
          colorFilter: const ColorFilter.mode(
            AppColors.deepViolet,
            BlendMode.srcIn,
          ),
        ),
      ),
      validator: (value) {
        return null;
      },
    );
  }
}
