import 'package:asyncstate/asyncstate.dart';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentsScanPage extends StatefulWidget {
  const DocumentsScanPage({super.key});

  @override
  State<DocumentsScanPage> createState() => _DocumentsScanPageState();
}

class _DocumentsScanPageState extends State<DocumentsScanPage> {
  late CameraController cameraController;

  @override
  void initState() {
    cameraController = CameraController(
      Injector.get<List<CameraDescription>>().first,
      ResolutionPreset.ultraHigh,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicAppBar(),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              width: sizeOf.width * 0.85,
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicTheme.orangeColor),
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/cam_icon.png'),
                  const SizedBox(height: 15),
                  const Text('TIRE A FOTO AGORA', style: LabClinicTheme.titleSmallStyle),
                  const SizedBox(height: 20),
                  const Text(
                    'Posicione o documento dentro do quadradro abaixo e clique no botão para fotografar.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LabClinicTheme.blueColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  FutureBuilder(
                    future: cameraController.initialize(),
                    builder: (context, snapshot) {
                      switch (snapshot) {
                        case AsyncSnapshot(
                            connectionState: ConnectionState.waiting || ConnectionState.active,
                          ):
                          return const CircularProgressIndicator();

                        case AsyncSnapshot(
                            connectionState: ConnectionState.done,
                          ):
                          if (cameraController.value.isInitialized) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: sizeOf.width * 0.46,
                                child: CameraPreview(
                                  cameraController,
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    strokeWidth: 4,
                                    strokeCap: StrokeCap.square,
                                    color: LabClinicTheme.orangeColor,
                                    dashPattern: const [1, 10, 1, 3],
                                    radius: const Radius.circular(16),
                                    child: const SizedBox.expand(),
                                  ),
                                ),
                              ),
                            );
                          }
                      }
                      return const Center(child: Text('Erro ao inicializar a câmera'));
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: sizeOf.width * 8,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);

                        final foto = await cameraController.takePicture().asyncLoader();

                        navigator.pushNamed('/self-service/documents/scan/confirm', arguments: foto);
                      },
                      child: const Text('TIRAR FOTO'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
