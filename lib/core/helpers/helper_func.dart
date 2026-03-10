import 'package:almeyar/core/utils/exports.dart';
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
