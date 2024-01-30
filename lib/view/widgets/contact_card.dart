import 'package:badal_task/config/colors.dart';
import 'package:badal_task/config/sizes.dart';
import 'package:badal_task/models/contact.dart';
import 'package:badal_task/view/widgets/numbers_list.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(contact.country.flag),
            ),
            UISize.xsmHorizontal,
            Text(
              contact.country.name,
              style: const TextStyle(
                  color: UIColors.textBold,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        NumbersList(customers: contact.customers),
      ],
    );
  }
}
