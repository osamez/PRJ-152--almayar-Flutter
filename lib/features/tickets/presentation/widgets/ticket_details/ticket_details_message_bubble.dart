part of '../../feature_imports.dart';

class TicketDetailsMessageBubble extends StatelessWidget {
  const TicketDetailsMessageBubble({
    super.key,
    required this.message,
    required this.date,
    required this.time,
    required this.isFromUser,
    this.fileUrl,
  });

  final String message;
  final String date;
  final String time;
  final bool isFromUser;
  final String? fileUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (message.isNotEmpty)
          Align(
            alignment: isFromUser
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w14,
                vertical: AppSizes.h12,
              ),
              decoration: BoxDecoration(
                color: isFromUser ? AppColors.orange : AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.radiusLg),
                  topRight: Radius.circular(AppSizes.radiusLg),
                  bottomLeft: Radius.circular(
                    isFromUser ? AppSizes.radiusLg : 0,
                  ),
                  bottomRight: Radius.circular(
                    isFromUser ? 0 : AppSizes.radiusLg,
                  ),
                ),
                boxShadow: isFromUser
                    ? null
                    : [
                        BoxShadow(
                          color: AppColors.shadow1.withValues(alpha: 0.8),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              child: Text(
                message,
                style: AppTextStyleFactory.create(
                  size: 14,
                  weight: FontWeight.w600,
                  color: isFromUser ? AppColors.white : AppColors.grey42,
                  height: 1.5,
                ),
              ),
            ),
          ),
        if (fileUrl != null && fileUrl!.isNotEmpty) ...[
          verticalSpace(AppSizes.h8),
          Align(
            alignment: isFromUser
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: _buildAttachment(context),
          ),
        ],
        verticalSpace(AppSizes.h6),
        Align(
          alignment: isFromUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            '$date $time',
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w300,
              color: AppColors.darkText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAttachment(BuildContext context) {
    final fileName = fileUrl!.split('/').last;
    return CustomInkWellWidget(
      onTap: () => _handleFileTap(context),
      radius: AppSizes.radiusMd,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w10,
          vertical: AppSizes.h10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow1.withValues(alpha: 0.8),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.w8),
              decoration: BoxDecoration(
                color: AppColors.grey98,
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              child: SvgPicture.asset(
                AppAssets.svgImagePlaceholder,
                width: AppSizes.w20,
                height: AppSizes.h20,
              ),
            ),
            horizontalSpace(AppSizes.w10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.svgEyes,
                    width: AppSizes.w16,
                    height: AppSizes.h16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.orange,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    fileName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyleFactory.create(
                      size: 11,
                      weight: FontWeight.w400,
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleFileTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                child: fileUrl!.startsWith('http')
                    ? CustomCachedImage(
                        imageUrl: fileUrl!,
                        fit: BoxFit.contain,
                      )
                    : Image.file(
                        File(fileUrl!),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            Positioned(
              top: AppSizes.h40,
              right: AppSizes.w16,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
