import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_error_widget.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';
import 'package:almeyar/core/widgets/internet_connection_widget.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';
import 'package:almeyar/features/shipment_tracking/presentation/feature_imports.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_order_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_order_details_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_orders_response_model.dart';
import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/features/delivery_requests/data/repos/delivery_requests_repo.dart';
import 'dart:async';

// Cubits
part 'cubits/delivery_requests_cubit.dart';
part 'cubits/delivery_requests_state.dart';
part 'cubits/delivery_request_details_cubit.dart';
part 'cubits/delivery_request_details_state.dart';

// Views
part 'views/delivery_requests_view.dart';
part 'views/delivery_request_item_details_view.dart';

// Widgets - delivery_requests
part 'widgets/delivery_requests/delivery_requests_view_body.dart';
part 'widgets/delivery_requests/delivery_requests_search_bar.dart';
part 'widgets/delivery_requests/delivery_type_tabs.dart';
part 'widgets/delivery_requests/delivery_requests_header.dart';
part 'widgets/delivery_requests/delivery_requests_list_view.dart';
part 'widgets/delivery_requests/delivery_request_card.dart';
part 'widgets/delivery_requests/delivery_request_card_header.dart';
part 'widgets/delivery_requests/delivery_request_status_badge.dart';
part 'widgets/delivery_requests/delivery_request_info_section.dart';
part 'widgets/delivery_requests/delivery_request_info_row.dart';
part 'widgets/delivery_requests/delivery_request_stats_section.dart';

// Widgets - request_item_details
part 'widgets/request_item_details/request_item_details_view_body.dart';
part 'widgets/request_item_details/request_item_details_header.dart';
part 'widgets/request_item_details/request_item_details_info_card.dart';
part 'widgets/request_item_details/request_item_details_tab_bar.dart';
part 'widgets/request_item_details/request_item_details_tab_section.dart';
part 'widgets/request_item_details/request_item_details_tab_item.dart';
part 'widgets/request_item_details/request_item_details_section_title.dart';
part 'widgets/request_item_details/request_item_details_info_row.dart';
part 'widgets/request_item_details/request_item_details_info_section.dart';
part 'widgets/request_item_details/request_item_details_basic_data_tab.dart';
part 'widgets/request_item_details/request_item_details_financial_data_tab.dart';
part 'widgets/request_item_details/request_item_details_financial_summary.dart';
part 'widgets/request_item_details/request_item_details_boxes_data_tab.dart';
part 'widgets/request_item_details/request_item_details_box_card.dart';
part 'widgets/request_item_details/request_item_details_box_header_row.dart';
part 'widgets/request_item_details/request_item_details_box_status_badge.dart';
part 'widgets/request_item_details/request_item_details_box_volume_weight_row.dart';
part 'widgets/request_item_details/request_item_details_box_info_row.dart';
part 'widgets/request_item_details/request_item_details_box_pricing_row.dart';
part 'widgets/request_item_details/request_item_details_box_pricing_item.dart';
