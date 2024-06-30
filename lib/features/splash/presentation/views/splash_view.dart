// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // todo
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      return Navigator.pushReplacementNamed(context, 'login');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
      ),
    );
  }
}
