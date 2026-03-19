part of '../../feature_imports.dart';

class CreateDepositRequestBottomSheet extends StatefulWidget {
  const CreateDepositRequestBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (context) => const CreateDepositRequestBottomSheet(),
    );
  }

  @override
  State<CreateDepositRequestBottomSheet> createState() =>
      _CreateDepositRequestBottomSheetState();
}

class _CreateDepositRequestBottomSheetState
    extends State<CreateDepositRequestBottomSheet> {
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

            Text(
              LocaleKeys.deposit_requests_amount.tr(),
              textAlign: TextAlign.end,
              style: AppTextStyleFactory.create(
                size: 13,
                weight: FontWeight.w600,
                color: AppColors.gray10,
              ),
            ),
            verticalSpace(AppSizes.h8),
            AppTextFormField(
              controller: _amountController,
              hintText: LocaleKeys.deposit_requests_amount_hint.tr(),
              validator: (_) => null,
              keyboardType: TextInputType.number,
            ),
            verticalSpace(AppSizes.h16),

            Text(
              LocaleKeys.deposit_requests_currency.tr(),
              textAlign: TextAlign.end,
              style: AppTextStyleFactory.create(
                size: 13,
                weight: FontWeight.w600,
                color: AppColors.gray10,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomInkWellWidget(
              radius: AppSizes.radiusSm,
              onTap: () {},
              child: Container(
                height: AppSizes.h56,
                alignment: Alignment.center,
                padding: EdgeInsetsDirectional.only(
                  start: AppSizes.w16,
                  end: AppSizes.w16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: AppColors.greyScale30,
                    width: AppSizes.w2,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.gray10,
                        size: AppSizes.h24,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        LocaleKeys.deposit_requests_currency_hint.tr(),
                        textAlign: TextAlign.end,
                        style: AppTextStyleFactory.create(
                          size: 14,
                          weight: FontWeight.w400,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(AppSizes.h16),

            Text(
              LocaleKeys.deposit_requests_transfer_type.tr(),
              textAlign: TextAlign.end,
              style: AppTextStyleFactory.create(
                size: 13,
                weight: FontWeight.w600,
                color: AppColors.gray10,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomInkWellWidget(
              radius: AppSizes.radiusSm,
              onTap: () {},
              child: Container(
                height: AppSizes.h56,
                alignment: Alignment.center,
                padding: EdgeInsetsDirectional.only(
                  start: AppSizes.w16,
                  end: AppSizes.w16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: AppColors.greyScale30,
                    width: AppSizes.w2,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.gray10,
                        size: AppSizes.h24,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        LocaleKeys.deposit_requests_transfer_type_hint.tr(),
                        textAlign: TextAlign.end,
                        style: AppTextStyleFactory.create(
                          size: 14,
                          weight: FontWeight.w400,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(AppSizes.h16),

            Text(
              LocaleKeys.deposit_requests_transfer_proof_attach.tr(),
              textAlign: TextAlign.end,
              style: AppTextStyleFactory.create(
                size: 13,
                weight: FontWeight.w600,
                color: AppColors.gray10,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomInkWellWidget(
              radius: AppSizes.radiusSm,
              onTap: () {},
              child: Container(
                height: AppSizes.h56,
                alignment: Alignment.center,
                padding: EdgeInsetsDirectional.only(
                  start: AppSizes.w16,
                  end: AppSizes.w16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: AppColors.greyScale30,
                    width: AppSizes.w2,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        AppAssets.svgPaperclip,
                        width: AppSizes.w20,
                        height: AppSizes.h20,
                        colorFilter: const ColorFilter.mode(
                          AppColors.gray10,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        LocaleKeys.deposit_requests_transfer_proof_attach_hint
                            .tr(),
                        textAlign: TextAlign.end,
                        style: AppTextStyleFactory.create(
                          size: 14,
                          weight: FontWeight.w400,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(AppSizes.h24),
            AppElevatedButton(
              text: LocaleKeys.deposit_requests_create_request.tr(),
              onPressed: () {},
              radius: AppSizes.radiusMd,
              height: AppSizes.h56,
              backgroundColor: AppColors.orange,
              textStyle: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
