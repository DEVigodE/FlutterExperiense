import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_self_service/src/model/self_service_model.dart';
import 'package:lab_clinic_self_service/src/modules/self_service/documents/widgets/document_box_widget.dart';
import 'package:lab_clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> with MessageViewMixin {
  final selfServiceController = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(selfServiceController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    final documents = selfServiceController.model.documents;
    final medicalOrder = documents?[DocumentType.medicalOrder]?.length ?? 0;
    final totalHealthInsurance = documents?[DocumentType.healthInsurance]?.length ?? 0;

    return Scaffold(
      appBar: LabClinicAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * 0.85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/folder.png'),
                const SizedBox(height: 24),
                const Text('ADICIONAR DOCUMENTOS', style: LabClinicTheme.titleSmallStyle),
                const SizedBox(height: 32),
                const Text(
                  'Selecione o documento que deseja fotografar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: LabClinicTheme.blueColor,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: sizeOf.width * 0.8,
                  height: 240,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DocumentBoxWidget(
                        uploaded: totalHealthInsurance > 0,
                        icon: Image.asset('assets/images/id_card.png'),
                        label: 'CARTEIRINHA',
                        totalFiles: totalHealthInsurance,
                        onTap: () async {
                          final filePath = await Navigator.of(context).pushNamed('/self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            selfServiceController.registerDocument(DocumentType.healthInsurance, filePath.toString());
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(width: 32),
                      DocumentBoxWidget(
                        uploaded: medicalOrder > 0,
                        icon: Image.asset('assets/images/document.png'),
                        label: 'PEDIDO MEDICO',
                        totalFiles: medicalOrder,
                        onTap: () async {
                          final filePath = await Navigator.of(context).pushNamed('/self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            selfServiceController.registerDocument(DocumentType.medicalOrder, filePath.toString());
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(visible: totalHealthInsurance > 0 && medicalOrder > 0, child: const SizedBox(height: 24)),
                Visibility(
                  visible: totalHealthInsurance > 0 && medicalOrder > 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            selfServiceController.clearDocuments();
                            setState(() {});
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            fixedSize: const Size.fromHeight(48),
                          ),
                          child: const Text('REMOVER TODAS'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await selfServiceController.finalize();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LabClinicTheme.orangeColor,
                            fixedSize: const Size.fromHeight(48),
                          ),
                          child: const Text("FINALIZAR"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
