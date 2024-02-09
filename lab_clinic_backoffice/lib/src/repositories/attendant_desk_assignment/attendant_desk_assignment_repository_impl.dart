import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'attendant_desk_assignment_repository.dart';

class AttendantDeskAssignmentRepositoryImpl implements AttendantDeskAssignmentRepository {
  final RestClient restClient;

  AttendantDeskAssignmentRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, Unit>> startService(int deskNumber) async {
    final result = await _clearDeskByUser();
    switch (result) {
      case Left(value: final expetion):
        return Left(expetion);
      case Right():
        await restClient.auth.post(
          '/attendantDeskAssignment',
          data: {
            'user_id': '#userAuthRef', //! pq nao tem backend, userId tem no token JWT
            'desk_number': deskNumber,
            'date_created': DateTime.now().toIso8601String(), //!!! pq nao tem backend
            'status': 'Available', //!!! pq nao tem backend
          },
        );
        return Right(unit);
    }
  }

  Future<Either<RepositoryException, Unit>> _clearDeskByUser() async {
    try {
      final desk = await _getDeskByUser();

      if (desk != null) await restClient.auth.delete('/attendantDeskAssignment/${desk.id}');

      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao limpar mesa do atendente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }

  Future<({String id, int deskNumber})?> _getDeskByUser() async {
    final Response(:List data) = await restClient.auth.get(
      '/attendantDeskAssignment',
      queryParameters: {'user_id': '#userAuthRef'}, //! queryParameters pq nao tem backend pois o userId tem no token JWT
    );

    if (data
        case List(
          isNotEmpty: true,
          first: {'id': String id, 'desk_number': int deskNumber},
        )) {
      return (
        id: id,
        deskNumber: deskNumber,
      );
    }
    return null;
  }

  @override
  Future<Either<RepositoryException, int>> getDeskAssingment() async {
    try {
      final Response(data: List(first: data)) = await restClient.auth.get(
        '/attendantDeskAssignment',
        queryParameters: {'userId': '#userAuthRef'}, //! queryParameters pq nao tem backend pois o userId tem no token JWT
      );
      return Right(data['desk_number']);
    } on DioException catch (e, s) {
      log('Erro ao buscar mesa do atendente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}

//! EXEMPLO DE DESTRUCTION
   //final Response(data: List(first: data)) = await restClient.auth.get(
   //  '/attendantDeskAssignment',
   //  /* QueryParameters pq nao tem backend pois o userId tem no token JWT */ queryParameters: {'userId': '#userAuthRef'},
   //);
   //   return (
   //  id: data['id'] as String,
   //  deskNumber: data['deskNumber'] as int,
   //);

//! EXEMPLO DE DESTRUCTION
//Future<({String id, int deskNumber})> _getDeskByUser() async {
//  final Response(data: List(first: {'id': String id, 'desk_number': int deskNumber})) = await restClient.auth.get(
//    '/attendantDeskAssignment',
//    queryParameters: {'userId': '#userAuthRef'}, //! queryParameters pq nao tem backend pois o userId tem no token JWT
//  );
//
//  return (
//    id: id,
//    deskNumber: deskNumber,
//  );
//}