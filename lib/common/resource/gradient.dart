import 'package:ahsan/common/resource/colors.dart';
import 'package:flutter/material.dart';

class BaseGradient {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [PrimaryColors.primary, PrimaryColors.secondary],
  );

  static const LinearGradient secondary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromRGBO(66, 197, 134, 1), Color.fromRGBO(44, 169, 109, 1)],
  );
}
