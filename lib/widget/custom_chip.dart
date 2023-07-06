import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.labelStyle,
    this.avatar,
    this.labelPadding,
  });

  final Widget label;
  final EdgeInsetsGeometry? labelPadding;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final Widget? avatar;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: labelPadding,
      avatar: avatar,
      label: label,
      labelStyle: labelStyle,
      backgroundColor: backgroundColor,
    );
  }
}
