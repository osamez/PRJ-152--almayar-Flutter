part of '../../feature_imports.dart';

class CreateDepositRequestBottomSheet extends StatefulWidget {
  const CreateDepositRequestBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    final cubit = context.read<DepositRequestsCubit>();
    cubit.clearAddDepositForm();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (context) => BlocProvider.value(
        value: cubit,

        child: const CreateDepositRequestBottomSheet(),
      ),
    );
  }

  @override
  State<CreateDepositRequestBottomSheet> createState() =>
      _CreateDepositRequestBottomSheetState();
}

class _CreateDepositRequestBottomSheetState
    extends State<CreateDepositRequestBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.w20,
        AppSizes.h12,
        AppSizes.w20,
        MediaQuery.of(context).viewInsets.bottom + AppSizes.h24,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: AppSizes.w82,
                  height: AppSizes.h8,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(AppSizes.radiusXxxl),
                  ),
                ),
              ),
              verticalSpace(AppSizes.h24),
              Text(
                LocaleKeys.deposit_requests_create_request.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyleFactory.create(
                  size: 20,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
              ),
              verticalSpace(AppSizes.h24),

              AppTextFormField(
                title: LocaleKeys.deposit_requests_amount.tr(),
                controller: _amountController,
                hintText: LocaleKeys.deposit_requests_amount_hint.tr(),
                isRequired: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return LocaleKeys.fieldRequired.tr();
                  if (double.tryParse(v) == null) {
                    return LocaleKeys.deposit_requests_amount_hint.tr();
                  }
                  return null;
                },
              ),
              verticalSpace(AppSizes.h16),

              const DepositRequestCurrencyField(),
              verticalSpace(AppSizes.h16),

              const DepositRequestTransferTypeField(),
              verticalSpace(AppSizes.h16),

              const DepositRequestAttachmentSection(isRequired: true),
              verticalSpace(AppSizes.h24),

              AppElevatedButton(
                text: LocaleKeys.deposit_requests_create_request.tr(),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  context.read<DepositRequestsCubit>().addDeposit(
                    amount: _amountController.text.trim(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
