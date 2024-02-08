import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicSelfServiceAppBar extends LabClinicAppBar {
  LabClinicSelfServiceAppBar({super.key})
      : super(
          actions: [
            PopupMenuButton<int>(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Reiniciar Processo'),
                  ),
                ];
              },
              onSelected: (value) async {
                Injector.get<SelfServiceController>().restartProcess();
              },
            )
          ],
        );
}
