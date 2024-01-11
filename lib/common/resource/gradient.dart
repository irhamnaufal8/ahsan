import 'package:ahsan/common/resource/colors.dart';
import 'package:flutter/material.dart';

class BaseGradient {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      PrimaryColors.primary,
      PrimaryColors.secondary
    ],
  );
}