import 'package:flutter/material.dart';
import 'package:sckan_app/app/injection.dart';

import 'app/app.dart';

void main() async {
  setupInjection();
  runApp(App());
}
