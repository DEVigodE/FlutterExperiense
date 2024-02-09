import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DataItem extends StatelessWidget {
  const DataItem({super.key, required this.label, required this.value, this.padding});

  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: LabClinicTheme.blueColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: LabClinicTheme.orangeColor,
            fontSize: 14,
          ),
        ),
      ],
    );

    if (padding != null) {
      return Padding(
        padding: padding!,
        child: widget,
      );
    }

    return widget;
  }
}
