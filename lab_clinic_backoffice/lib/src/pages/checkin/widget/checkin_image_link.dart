import 'package:flutter/material.dart';
import 'package:lab_clinic_backoffice/src/pages/checkin/widget/checkin_image_dialog.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class CheckinImageLink extends StatelessWidget {
  const CheckinImageLink({super.key, required this.label, required this.image});

  final String label;
  final String image;

  void showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CheckinImageDialog(context, pathImage: image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showImageDialog(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
