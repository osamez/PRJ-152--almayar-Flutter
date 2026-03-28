part of '../../feature_imports.dart';

class AddNewMoneyTransferExchangeRateWarning extends StatelessWidget {
  const AddNewMoneyTransferExchangeRateWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      buildWhen: (previous, current) =>
          previous.noteCalculateMoneyTransferState !=
          current.noteCalculateMoneyTransferState,
      builder: (context, state) {
        return state.noteCalculateMoneyTransferState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Skeletonizer(
            enabled: true,
            child: _buildCalculationBox(
              context,
              amount: '00.0',
              due: '00.0',
              message: LocaleKeys.add_money_transfer_exchange_rate_warning.tr(
                namedArgs: {'amount': '00.0', 'due': '00.0'},
              ),
            ),
          ),
          data: (data) => _buildCalculationBox(
            context,
            amount: data.totalInvoice?.toString() ?? '0',
            due: data.valueDuePayment?.toString() ?? '0',
            message:
                data.message ??
                LocaleKeys.add_money_transfer_exchange_rate_warning.tr(
                  namedArgs: {
                    'amount': data.totalInvoice?.toString() ?? '0',
                    'due': data.valueDuePayment?.toString() ?? '0',
                  },
                ),
          ),
          error: (failure) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildCalculationBox(
    BuildContext context, {
    required String amount,
    required String due,
    required String message,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: AppSizes.h16),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h14,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.gray, width: 1),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconRoundedBox(
            iconPath: AppAssets.svgWarning,
            backgroundColor: AppColors.yellow,
            iconColor: AppColors.darkSlate,
            iconHeight: AppSizes.h22,
            iconWidth: AppSizes.w22,
            width: AppSizes.w32,
            height: AppSizes.h32,
            radius: AppSizes.radiusXxs,
            padding: const EdgeInsets.all(6),
          ),
          horizontalSpace(AppSizes.w12),
          Expanded(
            child: Text(
              message,
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.darkText,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          horizontalSpace(AppSizes.w10),
        ],
      ),
    );
  }
}
