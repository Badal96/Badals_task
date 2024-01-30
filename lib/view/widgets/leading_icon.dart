import 'package:badal_task/config/colors.dart';
import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  final void Function() onPressed;
  final Widget leadingIcon;
  const LeadingIcon(
      {super.key, required this.leadingIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: UIColors.background,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: leadingIcon,
      ),
    );
  }
}
