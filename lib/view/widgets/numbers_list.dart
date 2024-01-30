import 'package:badal_task/config/colors.dart';
import 'package:badal_task/config/sizes.dart';
import 'package:badal_task/models/customer.dart';
import 'package:flutter/material.dart';

import '../../config/assets.dart';

class NumbersList extends StatelessWidget {
  final List<CustomerModel> customers;
  const NumbersList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UIColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: customers
            .map((e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: UIColors.appWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Image.asset(
                              Assets.phone,
                              color: UIColors.textBold,
                            ),
                          ),
                        ),
                        UISize.smHorizontal,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              e.number,
                              style: const TextStyle(
                                color: UIColors.textBold,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            UISize.xsmVertical,
                            Text(
                              e.region,
                              style: const TextStyle(
                                  color: UIColors.textLight,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                              color: UIColors.appWhite,
                              border:
                                  Border.all(color: const Color(0XFFD4D9E0)),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                color: UIColors.textBold,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        UISize.smHorizontal,
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0XFFD4D9E0)),
                            color: UIColors.appWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Text(
                              'V',
                              style: TextStyle(
                                color: UIColors.textBold,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ]),
                ))
            .toList(),
      ),
    );
  }
}
