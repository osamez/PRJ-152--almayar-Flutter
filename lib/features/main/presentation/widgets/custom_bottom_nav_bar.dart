part of '../features_imports.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: AppSizes.h8,
      color: Colors.white,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: AppSizes.h60,
        child: BlocBuilder<MainCubit, int>(
          builder: (context, selectedIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context: context,
                  index: 0,
                  icon: AppAssets.svgHome,
                  activeIcon: AppAssets.svgHomeSolid,
                  label: "الرئيسية ",
                  selectedIndex: selectedIndex,
                ),
                _buildNavItem(
                  context: context,
                  index: 1,
                  icon: AppAssets.svgShipments,
                  activeIcon: AppAssets.svgShipmentsSolid,
                  label: "الشحنات ",
                  selectedIndex: selectedIndex,
                ),
                SizedBox(width: AppSizes.w48), // Space for FAB
                _buildNavItem(
                  context: context,
                  index: 2,
                  icon: AppAssets.svgWallet,
                  activeIcon: AppAssets.svgWalletSolid,
                  label: "المحافظ ",
                  selectedIndex: selectedIndex,
                ),
                _buildNavItem(
                  context: context,
                  index: 3,
                  icon: AppAssets.svgUser,
                  activeIcon: AppAssets.svgUserSolid,
                  label: "الملف الشخصي",
                  selectedIndex: selectedIndex,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required String icon,
    required String activeIcon,
    required String label,
    required int selectedIndex,
  }) {
    final isSelected = selectedIndex == index;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => context.read<MainCubit>().changeIndex(index),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w12,
          vertical: AppSizes.h4,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? activeIcon : icon,
              width: AppSizes.w24,
              height: AppSizes.h24,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: isSelected ? null : 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: AppSizes.h4),
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyleFactory.create(
                        size: 12,
                        weight: FontWeight.w500,
                        color: isSelected ? theme.primaryColor : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
