import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';
import 'package:almeyar/core/widgets/custom_dropdowon_search_list.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/features/price_calculator/presentation/cubit/price_calculator_cubit.dart';
import 'package:almeyar/core/utils/loading_dialog.dart';
import 'package:almeyar/core/widgets/custom_error_widget.dart';
import 'package:almeyar/core/helpers/app_snack_bar.dart';

// Views
part 'views/price_calculator_view.dart';

// Widgets - Price Calculator
part 'widgets/price_calculator/price_calculator_view_body.dart';
part 'widgets/price_calculator/price_calculator_shipping_type_section.dart';
part 'widgets/price_calculator/price_calculator_shipping_type_toggle.dart';
part 'widgets/price_calculator/price_calculator_shipping_method_section.dart';
part 'widgets/price_calculator/price_calculator_shipping_method_toggle.dart';
part 'widgets/price_calculator/price_calculator_pickup_branch_field.dart';
part 'widgets/price_calculator/price_calculator_delivery_branch_field.dart';
part 'widgets/price_calculator/price_calculator_classification_field.dart';
part 'widgets/price_calculator/price_calculator_weight_volume_section.dart';
part 'widgets/price_calculator/price_calculator_bloc_listener.dart';
part 'widgets/price_calculator/price_calculator_result_bottom_sheet.dart';
part 'widgets/price_calculator/price_calculator_cost_card.dart';
