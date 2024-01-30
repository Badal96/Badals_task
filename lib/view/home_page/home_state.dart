import 'package:badal_task/models/contact.dart';

import '../../../config/enums.dart';

class HomeState {
  final MessageType messageType;
  final bool showNumber;
  final PhoneType phoneType;
  final List<ContactModel> contacts;
  HomeState({
    required this.messageType,
    required this.showNumber,
    required this.phoneType,
    required this.contacts,
  });

  HomeState copyWith({
    MessageType? messageType,
    bool? showNumber,
    PhoneType? phoneType,
    List<ContactModel>? contacts,
  }) {
    return HomeState(
      contacts: contacts ?? this.contacts,
      messageType: messageType ?? this.messageType,
      showNumber: showNumber ?? this.showNumber,
      phoneType: phoneType ?? this.phoneType,
    );
  }
}
