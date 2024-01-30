import 'package:badal_task/config/colors.dart';
import 'package:flutter/widgets.dart';

class MessageTypeWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function() onTap;

  const MessageTypeWidget(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: const BoxConstraints(minHeight: 36),
        margin: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 40 / 800,
        decoration: BoxDecoration(
          color: isSelected ? UIColors.appGreen : UIColors.appWhite,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: isSelected ? UIColors.textBold : UIColors.textLight,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
