part of '../../feature_imports.dart';

class InspectionServiceCard extends StatefulWidget {
  const InspectionServiceCard({super.key});

  @override
  State<InspectionServiceCard> createState() => _InspectionServiceCardState();
}

class _InspectionServiceCardState extends State<InspectionServiceCard> {
  bool _isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.all(AppSizes.w16),
      decoration: BoxDecoration(
        color: _isEnabled
            ? AppColors.green.withValues(alpha: 0.05)
            : AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(
          color: _isEnabled ? AppColors.green : AppColors.gray,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.receive_shipment_inspection_service.tr(),
                  style: AppTextStyleFactory.create(
                    size: 16,
                    weight: FontWeight.w700,
                    color: AppColors.deepViolet,
                  ),
                ),
                verticalSpace(AppSizes.h8),
                Text.rich(
                  TextSpan(
                    text: LocaleKeys.receive_shipment_inspection_service_desc
                        .tr(),

                    style: AppTextStyleFactory.create(
                      size: 12,
                      weight: FontWeight.w400,

                      color: AppColors.deepViolet,
                    ),
                    children: [
                      TextSpan(
                        text: r'(تكلفة الخدمة 2$)',
                        style: AppTextStyleFactory.create(
                          size: 12,
                          weight: FontWeight.w400,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(AppSizes.w12),
          Column(
            children: [
              CustomIconRoundedBox(
                iconPath: AppAssets.svgCube,
                width: AppSizes.w44,
                height: AppSizes.h44,
                backgroundColor: AppColors.grey,
              ),
              verticalSpace(AppSizes.h8),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: _isEnabled,
                  activeThumbColor: AppColors.green,
                  inactiveThumbColor: AppColors.deepViolet,
                  activeTrackColor: AppColors.green.withValues(alpha: 0.5),
                  inactiveTrackColor: AppColors.white,
                  trackOutlineColor: WidgetStateProperty.all(
                    _isEnabled ? AppColors.green : AppColors.deepViolet,
                  ),

                  onChanged: (value) {
                    setState(() {
                      _isEnabled = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
