// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sckan_app/app/injection.dart';

import 'app/app.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(App());
}
