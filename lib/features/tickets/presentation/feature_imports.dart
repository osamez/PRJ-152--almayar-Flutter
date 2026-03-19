import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/helpers/app_snack_bar.dart';
import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/widgets/custom_error_widget.dart';
import 'package:almeyar/core/widgets/internet_connection_widget.dart';
import 'package:almeyar/core/widgets/status_badge.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/features/shipment_tracking/presentation/feature_imports.dart';

import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'package:almeyar/features/tickets/data/repositories/tickets_repo.dart';

// Cubits
part 'cubits/tickets/tickets_cubit.dart';
part 'cubits/tickets/tickets_state.dart';

part 'views/support_tickets_view.dart';
part 'widgets/support_tickets/support_tickets_view_body.dart';
part 'widgets/support_tickets/support_tickets_tab_bar.dart';
part 'widgets/support_tickets/support_tickets_tab_item.dart';
part 'widgets/support_tickets/support_tickets_add_button.dart';
part 'widgets/support_tickets/support_tickets_bloc_listener.dart';
part 'widgets/support_tickets/support_tickets_list_bloc_builder.dart';
part 'widgets/support_tickets/support_tickets_list.dart';
part 'widgets/support_tickets/support_ticket_card.dart';
part 'widgets/support_tickets/support_ticket_card_info.dart';
part 'widgets/support_tickets/support_ticket_card_badges.dart';
part 'widgets/support_tickets/support_ticket_card_icon.dart';

// Views - add_new_ticket
part 'views/add_new_ticket_view.dart';

// Widgets - add_new_ticket
part 'widgets/add_new_ticket/add_new_ticket_view_body.dart';
part 'widgets/add_new_ticket/add_new_ticket_directed_to_field.dart';
part 'widgets/add_new_ticket/add_new_ticket_priority_field.dart';
part 'widgets/add_new_ticket/add_new_ticket_submit_button.dart';

// Views - ticket_details
part 'views/ticket_details_view.dart';

// Widgets - ticket_details
part 'widgets/ticket_details/ticket_details_view_body.dart';
part 'widgets/ticket_details/ticket_details_info_section.dart';
part 'widgets/ticket_details/ticket_details_info_row.dart';
part 'widgets/ticket_details/ticket_details_description_card.dart';
part 'widgets/ticket_details/ticket_details_correspondence_section.dart';
part 'widgets/ticket_details/ticket_details_message_bubble.dart';
part 'widgets/ticket_details/ticket_details_reply_input.dart';
