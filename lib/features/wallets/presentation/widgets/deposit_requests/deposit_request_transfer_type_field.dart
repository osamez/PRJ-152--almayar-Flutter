part of '../../feature_imports.dart';

class DepositRequestTransferTypeField extends StatelessWidget {
  const DepositRequestTransferTypeField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositRequestsCubit, DepositRequestsState>(
      buildWhen: (prev, curr) =>
          prev.getDepositMetadataState != curr.getDepositMetadataState ||
          prev.selectedTransferType != curr.selectedTransferType,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.deposit_requests_transfer_type.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<TransferTypeModel>(
              items: state.depositTransferTypes,
              initialValue: state.selectedTransferType,
              onChanged: context
                  .read<DepositRequestsCubit>()
                  .selectTransferType,
              itemAsString: (item) => item.name ?? '',
              hintText: LocaleKeys.deposit_requests_transfer_type_hint.tr(),
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.fieldRequired.tr();
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
