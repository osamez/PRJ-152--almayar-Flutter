import 'dart:async';
import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';
import 'package:almeyar/core/widgets/internet_connection_widget.dart';
import 'package:almeyar/features/pickup_request/presentation/widgets/shipment_pickup_requests/pickup_filter_bottom_sheet.dart';
import 'package:almeyar/core/widgets/custom_cached_image.dart';
import 'package:almeyar/core/widgets/custom_error_widget.dart';

import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'dart:io';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/loading_dialog.dart';
import 'package:almeyar/core/helpers/app_snack_bar.dart';
import 'package:almeyar/core/widgets/custom_dropdowon_search_list.dart';
import 'package:almeyar/core/services/image_picker_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/widgets/phone_form_field.dart';
import 'package:almeyar/features/pickup_request/data/repositories/pickup_request_repo.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';
import 'package:almeyar/features/pickup_request/data/models/add_shipment_request_response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/widgets/pickup_card.dart';

// State Management
part 'cubit/shipment_pickup_requests_state.dart';
part 'cubit/shipment_pickup_requests_cubit.dart';
part 'cubit/receive_shipment_state.dart';
part 'cubit/receive_shipment_cubit.dart';

part 'views/request_receive_shipment_view.dart';
part 'widgets/request_receive_shipment/request_receive_shipment_view_body.dart';
part 'widgets/request_receive_shipment/request_receive_shipment_item.dart';
part 'widgets/request_receive_shipment/shipment_image.dart';
part 'widgets/request_receive_shipment/prohibited_card.dart';

// Receive Shipment
part 'views/receive_shipment_view.dart';
part 'widgets/receive_shipment/receive_shipment_view_body.dart';
part 'widgets/receive_shipment/receive_shipment_bloc_listener.dart';
part 'widgets/receive_shipment/shipment_type.dart';
part 'widgets/receive_shipment/shipping_type_selector.dart';
part 'widgets/receive_shipment/inspection_service_card.dart';
part 'widgets/receive_shipment/file_upload_item.dart';
part 'widgets/receive_shipment/section_title.dart';
part 'widgets/receive_shipment/shipping_type_section.dart';
part 'widgets/receive_shipment/pickup_branch_field.dart';
part 'widgets/receive_shipment/delivery_branch_field.dart';
part 'widgets/receive_shipment/supplier_phone_field.dart';
part 'widgets/receive_shipment/classification_field.dart';
part 'widgets/receive_shipment/boxes_and_contents_section.dart';
part 'widgets/receive_shipment/weight_volume_section.dart';
part 'widgets/receive_shipment/media_list_item.dart';
part 'widgets/receive_shipment/upload_media_section.dart';
part 'widgets/receive_shipment/content_shipment_dropdownlist.dart';

// Shipment Pickup Requests
part 'views/shipment_pickup_requests_view.dart';
part 'widgets/shipment_pickup_requests/shipment_pickup_requests_view_body.dart';
part 'widgets/shipment_pickup_requests/pickup_search_bar.dart';
part 'widgets/shipment_pickup_requests/pickup_shipping_type_tabs.dart';
part 'widgets/shipment_pickup_requests/pickup_filter_header.dart';
part 'widgets/shipment_pickup_requests/pickup_requests_list_view.dart';
part 'widgets/shipment_pickup_requests/pickup_request_status.dart';
part 'widgets/shipment_pickup_requests/pickup_request_card_header.dart';
part 'widgets/shipment_pickup_requests/pickup_request_status_badge.dart';
part 'widgets/shipment_pickup_requests/pickup_request_route_section.dart';
part 'widgets/shipment_pickup_requests/route_location_label.dart';
part 'widgets/shipment_pickup_requests/route_divider_with_icon.dart';
part 'widgets/shipment_pickup_requests/pickup_request_stats_section.dart';
part 'widgets/shipment_pickup_requests/pickup_request_stat_item.dart';

// Shipment Pickup Details
part 'views/shipment_request_pickup_details_view.dart';
part 'widgets/shipment_request_pickup_details/shipment_request_pickup_details_view_body.dart';
part 'widgets/shipment_request_pickup_details/details_header_card.dart';
part 'widgets/shipment_request_pickup_details/details_stats_row.dart';
part 'widgets/shipment_request_pickup_details/details_info_section.dart';
part 'widgets/shipment_request_pickup_details/info_row.dart';
part 'widgets/shipment_request_pickup_details/details_inspection_card.dart';
part 'widgets/shipment_request_pickup_details/details_note_card.dart';
part 'widgets/shipment_request_pickup_details/details_media_grid.dart';
