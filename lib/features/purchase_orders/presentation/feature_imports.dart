import 'dart:async';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';
import 'package:almeyar/core/widgets/media_grid.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/widgets/internet_connection_widget.dart';
import 'package:almeyar/core/widgets/custom_error_widget.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/models/wallet_model.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/helpers/app_snack_bar.dart';
import 'package:almeyar/core/utils/loading_dialog.dart';
import 'package:almeyar/features/purchase_orders/data/models/add_purchase_request_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_order_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_site_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_sites_response_model.dart';
import 'package:almeyar/features/purchase_orders/data/repos/purchase_orders_repo.dart';
import 'package:url_launcher/url_launcher.dart';

// Cubits
part 'cubits/purchase_orders/purchase_orders_cubit.dart';
part 'cubits/purchase_orders/purchase_orders_state.dart';
part 'cubits/shopping_sites/shopping_sites_cubit.dart';
part 'cubits/shopping_sites/shopping_sites_state.dart';
part 'cubits/add_purchase_order/add_purchase_order_cubit.dart';
part 'cubits/add_purchase_order/add_purchase_order_state.dart';

// Views
part 'views/shopping_sites_view.dart';
part 'views/purchase_orders_view.dart';

// Widgets - shopping_sites
part 'widgets/shopping_sites/shopping_sites_view_body.dart';
part 'widgets/shopping_sites/shopping_sites_search_bar.dart';
part 'widgets/shopping_sites/shopping_sites_grid.dart';
part 'widgets/shopping_sites/shopping_site_card.dart';

// Views - add_purchase_order
part 'views/add_purchase_order_view.dart';

// Widgets - add_purchase_order
part 'widgets/add_purchase_order/add_purchase_order_bloc_listener.dart';
part 'widgets/add_purchase_order/add_purchase_order_view_body.dart';
part 'widgets/add_purchase_order/add_purchase_order_shopping_site_field.dart';
part 'widgets/add_purchase_order/add_purchase_order_wallet_field.dart';

// Widgets - purchase_orders
part 'widgets/purchase_orders/purchase_orders_view_body.dart';
part 'widgets/purchase_orders/purchase_orders_search_bar.dart';
part 'widgets/purchase_orders/purchase_orders_add_button.dart';
part 'widgets/purchase_orders/purchase_orders_filter_header.dart';
part 'widgets/purchase_orders/purchase_order_card.dart';
part 'widgets/purchase_orders/purchase_order_card_header.dart';
part 'widgets/purchase_orders/purchase_order_status_badge.dart';
part 'widgets/purchase_orders/purchase_order_info_section.dart';
part 'widgets/purchase_orders/purchase_order_info_row.dart';
part 'widgets/purchase_orders/purchase_order_stats_section.dart';
part 'widgets/purchase_orders/filter_purchase_orders_bottom_sheet.dart';
part 'widgets/purchase_orders/filter_purchase_order_option.dart';

// Views - purchase_order_details
part 'views/purchase_order_details_view.dart';

// Widgets - purchase_order_details
part 'widgets/purchase_order_details/purchase_order_details_view_body.dart';
part 'widgets/purchase_order_details/purchase_order_details_header.dart';
part 'widgets/purchase_order_details/purchase_order_details_info_card.dart';
part 'widgets/purchase_order_details/purchase_order_details_section_title.dart';
part 'widgets/purchase_order_details/purchase_order_details_info_row.dart';
part 'widgets/purchase_order_details/purchase_order_details_info_section.dart';
