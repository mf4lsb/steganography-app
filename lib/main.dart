import 'package:flutter/material.dart';
import 'package:steganography_app/constants/custom_colors.dart';
import 'package:steganography_app/views/login/login_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest',
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.background,
      ),
      home: const LoginView(),
    );
  }
}
