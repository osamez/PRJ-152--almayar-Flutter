import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';
import 'package:almeyar/core/widgets/details_info_row.dart';
import 'package:almeyar/core/widgets/details_info_section.dart';
import 'package:almeyar/features/shipment_tracking/presentation/feature_imports.dart';
import 'package:almeyar/features/wallets/presentation/cubit/confirm_transfer_cubit.dart';
import 'package:pinput/pinput.dart';

// Views
part 'views/wallets_view.dart';
part 'views/account_statement_view.dart';
part 'views/wallet_money_transfer_view.dart';

// Widgets - wallets
part 'widgets/wallets/wallets_view_body.dart';
part 'widgets/wallets/wallets_header.dart';
part 'widgets/wallets/wallet_card.dart';
part 'widgets/wallets/wallet_card_info.dart';

// Widgets - account statement
part 'widgets/account_statement/account_statement_view_body.dart';
part 'widgets/wallet_banner.dart';
part 'widgets/account_statement/account_statement_action_buttons_row.dart';
part 'widgets/account_statement/account_statement_action_button.dart';
part 'widgets/account_statement/account_statement_filter_header.dart';
part 'widgets/account_statement/account_statement_transaction_card.dart';
part 'widgets/account_statement/filter_account_bottom_sheet.dart';
part 'widgets/account_statement/filter_account_drag_handle.dart';

// Widgets - wallet money transfer
part 'widgets/wallet_money_transfer/wallet_money_transfer_view_body.dart';
part 'widgets/wallet_money_transfer/wallet_money_transfer_summary_card.dart';
part 'widgets/wallet_money_transfer/wallet_money_transfer_submit_button.dart';

// Widgets - confirm transfer bottom sheet
part 'widgets/wallet_money_transfer/confirm_transfer_bottom_sheet.dart';
part 'widgets/wallet_money_transfer/confirm_transfer_pin_input.dart';
part 'widgets/wallet_money_transfer/confirm_transfer_timer_text.dart';
