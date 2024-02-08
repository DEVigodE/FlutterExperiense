import 'dart:typed_data';

import 'package:asyncstate/asyncstate.dart';
import 'package:lab_clinic_self_service/src/repositories/documents/documents_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  DocumentsScanConfirmController({
    required this.documentsRepository,
  });

  final DocumentsRepository documentsRepository;

  final pathRemoteStorage = signal<String?>(null);

  Future<void> uploadImage(Uint8List imageBytes, String fileName) async {
    final result = await documentsRepository.uploadImage(imageBytes, fileName).asyncLoader();
    switch (result) {
      case Left():
        showError('Erro ao fazer upload da imagem');
        break;
      case Right(value: final pathImage):
        pathRemoteStorage.value = pathImage;
        break;
    }
  }
}
