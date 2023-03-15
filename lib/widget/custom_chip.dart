import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.labelStyle,
    this.avatar,
  });

  final String label;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final Widget? avatar;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: avatar,
      label: Text(label),
      labelStyle: labelStyle,
      backgroundColor: backgroundColor,
    );
  }
}
