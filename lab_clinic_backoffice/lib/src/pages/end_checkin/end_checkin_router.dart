import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/pages/end_checkin/end_checkin_page.dart';

class EndCheckinRouter extends FlutterGetItPageRouter {
  const EndCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get routeName => '/end-checkin';

  @override
  WidgetBuilder get view => (_) => const EndCheckinPage();
}
