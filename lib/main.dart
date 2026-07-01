import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitchakornapp/cores/app_service.dart';
import 'package:pitchakornapp/states/login_page.dart';
import 'package:pitchakornapp/cores/app_http_overide.dart';
import 'dart:io';

Future<void> main() async {
  HttpOverrides.global = AppHttpOveride();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: const LoginPage(),
    );
  }
}
