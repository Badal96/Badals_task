import 'package:badal_task/models/country.dart';
import 'package:badal_task/models/customer.dart';

class ContactModel {
  final CountryModel country;
  final List<CustomerModel> customers;

  const ContactModel({required this.country, required this.customers});
}
