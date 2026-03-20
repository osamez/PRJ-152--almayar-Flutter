import 'package:almeyar/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TransactionTypeModel {
  final int id;
  final String name;

  const TransactionTypeModel({
    required this.id,
    required this.name,
  });

  static List<TransactionTypeModel> get all => [
        TransactionTypeModel(
          id: 1,
          name: LocaleKeys.transaction_type_receipt.tr(),
        ),
        TransactionTypeModel(
          id: 2,
          name: LocaleKeys.transaction_type_disbursement.tr(),
        ),
        TransactionTypeModel(
          id: 3,
          name: LocaleKeys.transaction_type_deposit.tr(),
        ),
        TransactionTypeModel(
          id: 4,
          name: LocaleKeys.transaction_type_withdraw.tr(),
        ),
        TransactionTypeModel(
          id: 5,
          name: LocaleKeys.transaction_type_benefit_deposit.tr(),
        ),
        TransactionTypeModel(
          id: 6,
          name: LocaleKeys.transaction_type_withdrawal_entitlement.tr(),
        ),
      ];
}
