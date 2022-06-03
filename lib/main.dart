import 'dart:async';
import 'dart:developer';
import 'package:digital14_flutter_task/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  // To Set the fix device orientation.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));

  await runZonedGuarded(() async {
    runApp(App());
  }, (Object error, StackTrace stack) async {
    log('On Error : ${error.toString()}');
  });
}
