import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/pages/pre_checkin/pre_checkin_page.dart';

class PreCheckinRouter extends FlutterGetItPageRouter {
  const PreCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => <Bind<Object>>[];

  @override
  String get routeName => '/pre-checkin';

  @override
  WidgetBuilder get view => (_) => PreCheckinPage();
}
