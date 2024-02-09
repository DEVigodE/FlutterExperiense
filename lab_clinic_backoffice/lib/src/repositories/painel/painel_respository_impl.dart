import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import './painel_respository.dart';

class PainelRespositoryImpl implements PainelRespository {
  final RestClient restClient;
  PainelRespositoryImpl({required this.restClient});
  @override
  Future<Either<RepositoryException, String>> callOnPanel(String password, int attendantDesk) async {
    try {
      final Response(data: {'id': id}) = await restClient.auth.post(
        '/painelCheckIn',
        data: {
          'password': password,
          'time_called': DateTime.now().toIso8601String(),
          'attendantDesk': attendantDesk,
        },
      );
      return Right(id);
    } on DioException catch (e, s) {
      log('Erro ao chamar pacient no painel', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
