part of '../../feature_imports.dart';

class TicketDetailsMessageBubble extends StatelessWidget {
  const TicketDetailsMessageBubble({
    super.key,
    required this.message,
    required this.date,
    required this.time,
    required this.isFromUser,
  });

  final String message;
  final String date;
  final String time;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isFromUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w14,
            vertical: AppSizes.h12,
          ),
          decoration: BoxDecoration(
            color: isFromUser ? AppColors.orange : AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radiusLg),
              topRight: Radius.circular(AppSizes.radiusLg),
              bottomLeft: Radius.circular(isFromUser ? AppSizes.radiusLg : 0),
              bottomRight: Radius.circular(isFromUser ? 0 : AppSizes.radiusLg),
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
              height: 2,
            ),
          ),
        ),
        verticalSpace(AppSizes.h6),
        Text(
          '$time $date',
          style: AppTextStyleFactory.create(
            size: 14,
            weight: FontWeight.w300,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}
