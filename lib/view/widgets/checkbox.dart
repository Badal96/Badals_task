import 'package:badal_task/config/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final void Function() onTap;
  const CustomCheckbox(
      {super.key, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: !isSelected
                  ? Border.all(width: 0.12, color: UIColors.textLight)
                  : null,
              color: isSelected ? UIColors.appGreen : UIColors.appWhite,
              borderRadius: BorderRadius.circular(18)),
          child: isSelected
              ? const Center(
                  child: Icon(
                    Icons.check_rounded,
                    color: UIColors.textBold,
                    size: 20,
                  ),
                )
              : Container()),
    );
  }
}
