part of '../../feature_imports.dart';

class DeliveryTypeTabs extends StatelessWidget {
  const DeliveryTypeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRequestsCubit, DeliveryRequestsState>(
      buildWhen: (previous, current) =>
          previous.selectedType != current.selectedType,
      builder: (context, state) {
        final bool isPersonal = state.selectedType == 'personal';
        return Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.delivery_requests_personal_pickup.tr(),
                onPressed: () => context
                    .read<DeliveryRequestsCubit>()
                    .onTypeChanged('personal'),
                backgroundColor:
                    isPersonal ? AppColors.orange : AppColors.white,
                textColor: isPersonal ? AppColors.white : AppColors.darkSlate,
              ),
            ),
            horizontalSpace(AppSizes.w10),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.delivery_requests_delivery_service.tr(),
                onPressed: () => context
                    .read<DeliveryRequestsCubit>()
                    .onTypeChanged('delivery_service'),
                backgroundColor:
                    !isPersonal ? AppColors.orange : AppColors.white,
                textColor: !isPersonal ? AppColors.white : AppColors.darkSlate,
              ),
            ),
          ],
        );
      },
    );
  }
}
