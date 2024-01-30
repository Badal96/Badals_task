import '../config/enums.dart';

class CustomerModel {
  final String region;
  final String number;
  final PhoneType phoneType;

  const CustomerModel({
    required this.region,
    required this.number,
    required this.phoneType,
  });
}
