part of '../../feature_imports.dart';

class ShoppingSitesSearchBar extends StatefulWidget {
  const ShoppingSitesSearchBar({super.key});

  @override
  State<ShoppingSitesSearchBar> createState() => _ShoppingSitesSearchBarState();
}

class _ShoppingSitesSearchBarState extends State<ShoppingSitesSearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.shopping_sites_search_hint.tr(),
      onChanged: (value) {
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
        }
        _debounce = Timer(const Duration(milliseconds: 500), () {
          context.read<ShoppingSitesCubit>().getShoppingSites(name: value);
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
      validator: (value) => null,
    );
  }
}
