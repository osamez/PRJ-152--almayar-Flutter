part of '../../feature_imports.dart';

class RequestItemDetailsViewBody extends StatelessWidget {
  const RequestItemDetailsViewBody({super.key, required this.id});

  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRequestDetailsCubit,
        DeliveryRequestDetailsState>(
      builder: (context, state) {
        return state.getDeliveryRequestDetailsState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildContent(context, isLoading: true),
          data: (data) => _buildContent(context, data: data),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () => context
                    .read<DeliveryRequestDetailsCubit>()
                    .getDeliveryRequestDetails(id),
              );
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () => context
                  .read<DeliveryRequestDetailsCubit>()
                  .getDeliveryRequestDetails(id),
            );
          },
        );
      },
    );
  }

  Widget _buildContent(BuildContext context,
      {DeliveryOrderDetailsModel? data, bool isLoading = false}) {
    return Skeletonizer(
      enabled: isLoading,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(AppSizes.h24),
            verticalSpace(AppSizes.h20),
            verticalSpace(AppSizes.h20),
            RequestItemDetailsInfoCard(
                order: data ?? const DeliveryOrderDetailsModel()),
            verticalSpace(AppSizes.h20),
            RequestItemDetailsTabSection(order: data),
            verticalSpace(AppSizes.h30),
          ],
        ),
      ),
    );
  }
}
