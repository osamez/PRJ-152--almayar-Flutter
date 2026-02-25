part of '../../feature_imports.dart';

class ShipmentInfoCopyRow extends StatelessWidget {
  const ShipmentInfoCopyRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w400,
            color: AppColors.lightHeadingText,
          ),
        ),
        verticalSpace(AppSizes.h8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w14,
            vertical: AppSizes.h14,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            border: Border.all(color: AppColors.gray),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.start,
                  style: AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w300,
                    color: AppColors.darkSlate,
                  ),
                ),
              ),
              horizontalSpace(AppSizes.w10),

              GestureDetector(
                onTap: () => _copyToClipboard(context),
                child: SvgPicture.asset(
                  AppAssets.svgCopy,
                  width: AppSizes.w22,
                  height: AppSizes.h22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
