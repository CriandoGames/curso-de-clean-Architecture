import 'package:curso_clear_arch/shared/di/container.dart';
import 'package:curso_clear_arch/presenter/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AutoContainer.setup();
  runApp(const MyApp());
}
