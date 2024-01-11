import 'package:ahsan/common/resource/colors.dart';
import 'package:ahsan/common/resource/fonts.dart';
import 'package:flutter/material.dart';

class AlertBadge extends StatelessWidget {
  final String text;
  final Color color;

  const AlertBadge(
      {Key? key, required this.text, this.color = AccentColors.lightRed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline,
            color: MonoColors.black2,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              style: Poppins.medium(12, color: MonoColors.black2),
            ),
          )
        ],
      ),
    );
  }
}
