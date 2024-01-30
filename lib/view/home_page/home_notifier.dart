import 'package:badal_task/config/assets.dart';
import 'package:badal_task/models/contact.dart';
import 'package:badal_task/models/country.dart';
import 'package:badal_task/models/customer.dart';
import 'package:badal_task/view/home_page/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/enums.dart';

final homeNotifier =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier());

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier()
      : super(HomeState(
          messageType: MessageType.mms,
          showNumber: false,
          phoneType: PhoneType.landlineOrMobile,
          contacts: List.generate(
              10,
              (index) => const ContactModel(
                    country: CountryModel(Assets.flag, 'United States'),
                    customers: [
                      CustomerModel(
                        region: 'New Jersey',
                        number: '+1 (201) 123 45 67',
                        phoneType: PhoneType.mobile,
                      ),
                      CustomerModel(
                        region: 'Washington',
                        number: '+1 (201) 123 45 67',
                        phoneType: PhoneType.mobile,
                      ),
                      CustomerModel(
                        region: 'New Jersey',
                        number: '+1 (201) 123 45 67',
                        phoneType: PhoneType.mobile,
                      ),
                    ],
                  )),
        ));

  void showNumber() {
    state = state.copyWith(showNumber: !state.showNumber);
  }

  void changeMessageType(MessageType type) {
    state = state.copyWith(messageType: type);
  }

  void changePhoneType(PhoneType phoneType) {
    if (state.phoneType != phoneType) {
      state = state.copyWith(phoneType: phoneType);
    }
  }
}
