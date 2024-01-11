import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType? keyboardType;
  final bool? isObsecure;
  final void Function()? showPassword;
  final String? Function(String? value)? onChange;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;

  const PrimaryTextField({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.keyboardType,
    this.isObsecure,
    this.showPassword,
    this.onChange,
    this.onEditingComplete,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObsecure ?? false,
      onChanged: onChange,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: Poppins.medium(14, color: MonoColors.gray1),
        suffixIcon: isObsecure != null
            ? GestureDetector(
                onTap: showPassword,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Icon(
                    isObsecure! ? Icons.visibility_off : Icons.visibility,
                    color: MonoColors.gray1,
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: MonoColors.gray2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: MonoColors.gray2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: PrimaryColors.primary,
          ),
        ),
      ),
    );
  }
}
