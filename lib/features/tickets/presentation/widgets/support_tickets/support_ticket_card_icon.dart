part of '../../feature_imports.dart';

class SupportTicketCardIcon extends StatelessWidget {
  const SupportTicketCardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.w48,
      height: AppSizes.h48,
      decoration: BoxDecoration(
        color: const Color(0xffd34127).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Center(
        child: SvgPicture.asset(
          AppAssets.svgTicket,
          width: AppSizes.w24,
          height: AppSizes.h24,
          colorFilter: const ColorFilter.mode(
            AppColors.orange,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
