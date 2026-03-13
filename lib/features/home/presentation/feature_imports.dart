import 'package:almeyar/core/enums/enums.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_rounder_arrow.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/flutter_html.dart';

export 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/svg.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:go_router/go_router.dart';
export 'package:almeyar/core/theme/app_colors.dart';
export 'package:almeyar/core/utils/app_assets.dart';
export 'package:almeyar/core/utils/app_sizes.dart';
export 'package:almeyar/core/theme/app_text_style_factory.dart';
export 'package:almeyar/core/helpers/spacing.dart';
export 'package:almeyar/core/helpers/extensions.dart';
export 'package:almeyar/core/widgets/app_elevated_button.dart';
export 'package:almeyar/core/widgets/app_text_form_field.dart';
export 'package:almeyar/core/widgets/custom_app_bar.dart';
export 'package:almeyar/core/widgets/custom_inkwell_widget.dart';
export 'package:almeyar/generated/locale_keys.g.dart';
export 'package:almeyar/core/routing/routes.dart';

// Local exports
export 'cubit/home_cubit.dart';
export 'views/home_view.dart';
export 'widgets/home/home_view_body.dart';
export 'widgets/home/home_banner.dart';
export 'widgets/home/home_horizontal_card.dart';
export 'widgets/home/home_vertical_card.dart';
export 'widgets/home/pay_service_card.dart';
export 'widgets/home/home_banner_two_image.dart';
export 'widgets/home/money_transfers.dart';

// Shipments addresses — part of this library
part 'views/shipments_addresses_view.dart';
part 'widgets/shipments_addresses/shipments_addresses_view_body.dart';
part 'widgets/shipments_addresses/addresses_image_card.dart';
part 'widgets/shipments_addresses/shipment_addresses_filters.dart';
part 'widgets/shipments_addresses/shipments_address_list_item.dart';

// Shipment address details
part 'views/shipment_address_details_view.dart';
part 'widgets/shipment_address_details/shipment_address_details_view_body.dart';
part 'widgets/shipment_address_details/shipment_details_country_card.dart';
part 'widgets/shipment_address_details/shipment_important_note_card.dart';
part 'widgets/shipment_address_details/shipment_info_copy_row.dart';
part 'widgets/shipment_address_details/shipment_type_dropdown.dart';

// Prohibited
part 'views/prohibited_view.dart';
part 'widgets/prohibited/prohibited_view_body.dart';
