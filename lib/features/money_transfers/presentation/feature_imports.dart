import 'dart:io';
import 'dart:async';

import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/helpers/app_snack_bar.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/utils/loading_dialog.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';
import 'package:almeyar/core/widgets/details_info_row.dart';
import 'package:almeyar/core/widgets/details_info_section.dart';
import 'package:almeyar/core/widgets/custom_dropdowon_search_list.dart';
import 'package:almeyar/features/auth/presentation/feature_imports.dart';
import 'package:almeyar/core/widgets/phone_form_field.dart';
import 'package:almeyar/features/money_transfers/data/repos/money_transfers_repo.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';
import 'package:almeyar/features/shipment_tracking/presentation/feature_imports.dart';
import 'package:almeyar/core/widgets/internet_connection_widget.dart';
import 'package:almeyar/core/widgets/custom_error_widget.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/money_transfer_currency_model.dart';
import '../data/models/money_transfer_model.dart';
import '../data/models/note_calculate_model.dart';
import '../data/models/note_calculate_request.dart';

// Cubits
part 'cubit/money_transfers/money_transfers_cubit.dart';
part 'cubit/money_transfers/money_transfers_state.dart';
part 'cubit/add_new_money_transfer/add_new_money_transfer_cubit.dart';
part 'cubit/add_new_money_transfer/add_new_money_transfer_state.dart';

// Views
part 'views/money_transfers_view.dart';
part 'views/add_new_money_transfer_view.dart';

// Widgets - add_new_money_transfer
part 'widgets/add_new_money_transfer/add_new_money_transfer_view_body.dart';
part 'widgets/add_new_money_transfer/add_new_money_transfer_invoice_image_field.dart';
part 'widgets/add_new_money_transfer/add_new_money_transfer_invoice_currency_field.dart';
part 'widgets/add_new_money_transfer/add_new_money_transfer_payment_currency_field.dart';
part 'widgets/add_new_money_transfer/add_new_money_transfer_exchange_rate_warning.dart';
part 'widgets/add_new_money_transfer/add_new_money_transfer_submit_button.dart';
part 'widgets/add_new_money_transfer/add_new_money_transfer_bloc_listener.dart';

// Widgets - money_transfers
part 'widgets/money_transfers/money_transfers_view_body.dart';
part 'widgets/money_transfers/money_transfers_tab_bar.dart';
part 'widgets/money_transfers/money_transfers_add_button.dart';
part 'widgets/money_transfers/money_transfer_card.dart';
part 'widgets/money_transfers/money_transfer_card_header.dart';
part 'widgets/money_transfers/money_transfer_status_badge.dart';
part 'widgets/money_transfers/money_transfer_info_section.dart';
part 'widgets/money_transfers/money_transfer_info_item.dart';
part 'widgets/money_transfers/money_transfer_list_veiw.dart';

// Views - money_transfer_details
part 'views/money_transfer_details_view.dart';

// Widgets - money_transfer_details
part 'widgets/money_transfer_details/money_transfer_details_view_body.dart';
