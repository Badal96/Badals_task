import 'package:flutter/material.dart';

class UISize {
  static const standard = 8.0;
  static const halfStandard = standard / 2;

  static const standardDoubled = standard * 2;
  static const standardTripled = standard * 3;
  static const standardQuadrupled = standard * 4;
  static const standardQuintupled = standard * 5;

  static const standardPlus2 = standard + 2;
  static const quarterStandard = standard / 4;
  static const tinyStandard = 1.0;

  // VERTICAL
  //-----------------------------------------------------------
  static const SizedBox xsmVertical = SizedBox(height: halfStandard);
  static const SizedBox smVertical = SizedBox(height: standard);
  static const SizedBox mdVertical = SizedBox(height: standardDoubled);
  static const SizedBox lgVertical = SizedBox(height: standardTripled);
  static const SizedBox xlVertical = SizedBox(height: standardQuadrupled);
  static const SizedBox xxlVertical = SizedBox(height: standardQuintupled);
  // HORIZONTAL
  //-----------------------------------------------------------
  static const SizedBox xsmHorizontal = SizedBox(width: halfStandard);
  static const SizedBox smHorizontal = SizedBox(width: standard);
  static const SizedBox mdHorizontal = SizedBox(width: standardDoubled);
  static const SizedBox lgHorizontal = SizedBox(width: standardTripled);
  static const SizedBox xlHorizontal = SizedBox(width: standardQuadrupled);
  static const SizedBox xxlHorizontal = SizedBox(width: standardQuintupled);
}
