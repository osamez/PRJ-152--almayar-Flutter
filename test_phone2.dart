import 'package:phone_numbers_parser/phone_numbers_parser.dart';

void main() {
  final values = [
    ('20', '010905295'),
    ('+20', '010905295'),
    ('+20', '0109052951'),
    ('+20', '01090529511'),
    ('+20', '1090529511'),
    ('+218', '010905295'),
    ('+966', '010905295'),
  ];
  
  for (var pair in values) {
    try {
      final phoneNumber = PhoneNumber.parse('${pair.$1}${pair.$2}');
      print('Parsed ${pair.$1} ${pair.$2}: ${phoneNumber.international} (${phoneNumber.isValid(type: PhoneNumberType.mobile)})');
    } catch (e) {
      print('Error parsing ${pair.$1} ${pair.$2}: $e');
    }
  }
}
