part of '../../feature_imports.dart';

class ShipmentAddressDetailsViewBody extends StatelessWidget {
  const ShipmentAddressDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
      child: Column(
        children: [
          const ShipmentDetailsCountryCard(
            arabicName: 'الصين - جوانزو',
            englishName: 'Guangzhou, China',
            flagAsset: AppAssets.svgFlagTest,
          ),
          verticalSpace(AppSizes.h16),
          const ShipmentImportantNoteCard(),
          verticalSpace(AppSizes.h16),
          const ShipmentTypeDropdown(),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_customer_name.tr(),
            value: 'أسامة مصطفى المرعي الجميل',
          ),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_main_address.tr(),
            value: 'عنوان تجريبي يمكن استبداله 14800',
          ),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_sub_address.tr(),
            value: 'عنوان تجريبي يمكن استبداله',
          ),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_city.tr(),
            value: 'مدينة تجريبية يمكن استبداله',
          ),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_region.tr(),
            value: 'منطقة تجريبية يمكن استبداله',
          ),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_postal_code.tr(),
            value: 'رمز بريدي تجريبي يمكن استبداله',
          ),
          verticalSpace(AppSizes.h16),
          ShipmentInfoCopyRow(
            label: LocaleKeys.shipment_details_phone_number.tr(),
            value: '+90 2345678765432',
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.shipment_details_copy_all.tr(),
            onPressed: () => _copyAllToClipboard(context),
          ),
          verticalSpace(AppSizes.h16),
        ],
      ),
    );
  }

  void _copyAllToClipboard(BuildContext context) {
    const allText =
        'أسامة مصطفى المرعي الجميل\n'
        'عنوان تجريبي يمكن استبداله 14800\n'
        'عنوان تجريبي يمكن استبداله\n'
        'مدينة تجريبية يمكن استبداله\n'
        'منطقة تجريبية يمكن استبداله\n'
        'رمز بريدي تجريبي يمكن استبداله\n'
        '+90 2345678765432';
    Clipboard.setData(const ClipboardData(text: allText));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.shipment_details_copy_all.tr()),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
