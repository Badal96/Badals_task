import 'package:badal_task/config/colors.dart';
import 'package:badal_task/view/home_page/home_notifier.dart';
import 'package:badal_task/view/widgets/checkbox.dart';
import 'package:badal_task/view/widgets/contact_card.dart';
import 'package:badal_task/view/widgets/leading_icon.dart';
import 'package:badal_task/view/widgets/message_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/assets.dart';
import '../../../config/enums.dart';
import '../../../config/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.appWhite,
      appBar: AppBar(
        titleSpacing: 16,
        elevation: 0,
        backgroundColor: UIColors.appWhite,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: UIColors.background,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Image.asset(Assets.drawerIcon)),
                ),
                UISize.smHorizontal,
                const Text(
                  '+12021234567',
                  style: TextStyle(
                      color: UIColors.textBold,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              children: [
                LeadingIcon(
                    onPressed: () {},
                    leadingIcon: Image.asset(
                      Assets.chart,
                    )),
                UISize.smHorizontal,
                LeadingIcon(
                    onPressed: () {},
                    leadingIcon: Image.asset(
                      Assets.message,
                      color: UIColors.textBold,
                    )),
                UISize.smHorizontal,
                LeadingIcon(
                    onPressed: () {},
                    leadingIcon: Image.asset(
                      Assets.notifications,
                    )),
              ],
            )
          ],
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final homeState = ref.watch(homeNotifier);
        return Padding(
            padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: UIColors.background,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MessageTypeWidget(
                                onTap: () => ref
                                    .read(homeNotifier.notifier)
                                    .changeMessageType(MessageType.sms),
                                isSelected:
                                    homeState.messageType == MessageType.sms,
                                text: MessageType.sms.title),
                          ),
                          Expanded(
                            child: MessageTypeWidget(
                                onTap: () => ref
                                    .read(homeNotifier.notifier)
                                    .changeMessageType(MessageType.mms),
                                isSelected:
                                    homeState.messageType == MessageType.mms,
                                text: MessageType.mms.title),
                          ),
                          Expanded(
                            child: MessageTypeWidget(
                                onTap: () => ref
                                    .read(homeNotifier.notifier)
                                    .changeMessageType(MessageType.voice),
                                isSelected:
                                    homeState.messageType == MessageType.voice,
                                text: MessageType.voice.title),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: UIColors.appWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField<PhoneType>(
                          style: const TextStyle(
                              color: UIColors.textBold,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          value: homeState.phoneType,
                          items: PhoneType.values
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.title)))
                              .toList(),
                          onChanged: (value) {
                            ref
                                .read(homeNotifier.notifier)
                                .changePhoneType(value!);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: Row(
                          children: [
                            Consumer(
                                builder: (context, ref, child) =>
                                    CustomCheckbox(
                                        isSelected: ref.watch(
                                            homeNotifier.select(
                                                (value) => value.showNumber)),
                                        onTap: () {
                                          ref
                                              .read(homeNotifier.notifier)
                                              .showNumber();
                                        })),
                            UISize.smHorizontal,
                            const Text(
                              'Show number without verification',
                              style: TextStyle(
                                  color: UIColors.textBold,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 25),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    itemCount: homeState.contacts.length,
                    itemBuilder: (context, index) => ContactCard(
                      contact: homeState.contacts[index],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
