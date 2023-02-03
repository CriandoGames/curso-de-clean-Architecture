import 'package:curso_clear_arch/shared/di/container.dart';
import 'package:curso_clear_arch/presenter/home/home_controller.dart';
import 'package:curso_clear_arch/presenter/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        controller: autoInjector.get<HomeController>(),
      ),
    );
  }
}
