import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:ahsan/common/resource/gradient.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool? isDisabled;
  final Function()? onTap;

  const PrimaryButton(
      {super.key, required this.text, this.isDisabled, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: (isDisabled ?? false) ? MonoColors.gray2 : null,
        gradient: (isDisabled ?? false) ? null : BaseGradient.primaryGradient,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        color: Colors.transparent,
        child: InkWell(
          onTap: (isDisabled ?? false) ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: Colors.white.withOpacity(0.7), // Set the splash color
          child: Ink(
            child: Center(
              child: Text(
                text,
                style: Poppins.bold(14, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
