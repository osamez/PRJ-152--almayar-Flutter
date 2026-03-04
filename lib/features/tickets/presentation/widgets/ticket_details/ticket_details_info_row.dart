part of '../../feature_imports.dart';

class TicketDetailsInfoRow extends StatelessWidget {
  const TicketDetailsInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w400,
            color: AppColors.hintColor,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w700,
              color: AppColors.darkText,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
