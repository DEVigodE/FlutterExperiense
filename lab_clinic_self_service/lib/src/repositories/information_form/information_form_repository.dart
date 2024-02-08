import 'package:lab_clinic_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class InformationFormRepository {
  Future<Either<RepositoryException, Unit>> register(SelfServiceModel model);
}
