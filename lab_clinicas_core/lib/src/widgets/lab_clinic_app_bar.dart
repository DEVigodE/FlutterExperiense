import 'package:flutter/material.dart';

class LabClinicAppBar extends AppBar {
  LabClinicAppBar({super.key, List<Widget>? actions, Widget? leading})
      : super(
          toolbarHeight: 72,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 64),
              child: Image.asset(
                'assets/images/logo_horizontal.png',
              ),
            ),
          ),
          actions: actions,
          leading: leading,
        );
}
