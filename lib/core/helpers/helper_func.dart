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

PickupRequestStatus mapStatus(String? name) {
  switch (name?.toLowerCase()) {
    case 'received':
    case 'approved':
      return PickupRequestStatus.received;
    case 'rejected':
    case 'cancelled':
      return PickupRequestStatus.rejected;
    case 'pending':
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
