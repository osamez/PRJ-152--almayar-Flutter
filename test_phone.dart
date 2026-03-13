import 'package:phone_numbers_parser/phone_numbers_parser.dart';

void main() {
  final countryCode = '+20';
  final value = '010905295';
  try {
    final phoneNumber = PhoneNumber.parse('$countryCode$value');
    print('Parsed: ${phoneNumber.international}');
    print('isValid: ${phoneNumber.isValid()}');
    print('isValid mobile: ${phoneNumber.isValid(type: PhoneNumberType.mobile)}');
    
    // Test alternative parsing
    final cleanValue = value.startsWith('0') ? value.substring(1) : value;
    final phoneNumber2 = PhoneNumber.parse('$countryCode$cleanValue');
    print('Parsed 2: ${phoneNumber2.international}');
    print('isValid 2: ${phoneNumber2.isValid()}');
    print('isValid 2 mobile: ${phoneNumber2.isValid(type: PhoneNumberType.mobile)}');

  } catch (e) {
    print('Error: $e');
  }
}
