import 'package:flutter/material.dart';
import 'package:products_app/core/injector.dart';
import 'package:products_app/utils/connection_status_singleton.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConnectionStatusSingleton.getInstance().checkConnection();
  configureInjector();

  runApp(const MyApp());

}


