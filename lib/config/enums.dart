enum MessageType {
  sms(title: 'SMS'),
  mms(title: 'MMS'),
  voice(title: 'Voice');

  final String title;
  const MessageType({required this.title});
}

enum PhoneType {
  landlineOrMobile(title: 'Landline or Mobile'),
  landline(title: 'Landline'),
  mobile(title: 'Mobile');

  final String title;
  const PhoneType({required this.title});
}
