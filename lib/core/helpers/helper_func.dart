import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

double calculateGridChildAspectRatio({
  required BuildContext context,
  double sectionPadding = 0,
  double spacing = 0,
  required double cardHeight,
  required int crossAxisCount,
}) {
  double screenWidth = context.width;
  double gridSpacing = ((crossAxisCount - 1) * spacing);
  double cardWidth =
      (screenWidth - (sectionPadding * 2) - gridSpacing) / crossAxisCount;
  return cardWidth / cardHeight;
}

bool validateInternationalPhoneNumber({
  required String value,
  required String countryCode,
}) {
  try {
    final phoneNumber = PhoneNumber.parse('$countryCode$value');

    if (phoneNumber.isValid(type: PhoneNumberType.mobile)) {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}

String formatDateFromApi(String apiDateString) {
  // 1. Parse the string into a DateTime object
  DateTime parsedDate = DateTime.parse(apiDateString);

  // 2. Format it to 'yyyy-MM-dd'
  String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

  return formattedDate;
}

PickupRequestStatus mapStatus(StatusModel? status) {
  final id = status?.id;
  final name = status?.name?.toLowerCase();

  switch (id) {
    case 3:
      return PickupRequestStatus.pickupPoint;
    case 14:
      return PickupRequestStatus.processing;
    case 15:
      return PickupRequestStatus.prepared;
    case 17:
      return PickupRequestStatus.shipping;
    case 19:
      return PickupRequestStatus.deliveryPoint;
    case 20:
      return PickupRequestStatus.readyToDeliver;
    case 11:
      return PickupRequestStatus.cancelled;
  }

  switch (name) {
    case 'received':
    case 'approved':
    case 'مستلمة':
      return PickupRequestStatus.received;
    case 'rejected':
      return PickupRequestStatus.rejected;
    case 'cancelled':
    case 'ملغية':
      return PickupRequestStatus.cancelled;
    case 'في نقطة الإلتقاط':
    case 'at_pickup_point':
      return PickupRequestStatus.pickupPoint;
    case 'قيد التجهيز':
    case 'processing':
    case 'being_prepared':
      return PickupRequestStatus.processing;
    case 'مجهزة':
    case 'prepared':
      return PickupRequestStatus.prepared;
    case 'قيد الشحن':
    case 'shipping':
    case 'being_shipped':
      return PickupRequestStatus.shipping;
    case 'في نقطة التسليم':
    case 'at_delivery_point':
      return PickupRequestStatus.deliveryPoint;
    case 'جاهزة التسليم':
    case 'جاهزة للتسليم':
    case 'ready_for_delivery':
      return PickupRequestStatus.readyToDeliver;
    case 'pending':
    case 'في الإنتظار':
    default:
      return PickupRequestStatus.pending;
  }
}

class NullableStringConverter implements JsonConverter<String?, dynamic> {
  const NullableStringConverter();

  @override
  String? fromJson(dynamic json) {
    if (json == null) return null;
    return json.toString();
  }

  @override
  dynamic toJson(String? object) => object;
}
