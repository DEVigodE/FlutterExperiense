import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:lab_clinic_backoffice/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class HomeController with MessageStateMixin {
  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;

  HomeController({required AttendantDeskAssignmentRepository attendantDeskAssignmentRepository})
      : _attendantDeskAssignmentRepository = attendantDeskAssignmentRepository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result = await _attendantDeskAssignmentRepository.startService(deskNumber);
    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        showError('Erro ao iniciar atendimento');
        break;
      case Right():
        asyncstate.AsyncState.hide();
        showInfo('Atendimento iniciado com sucesso');
    }
  }
}
