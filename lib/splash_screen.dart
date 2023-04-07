// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test1/prodect/view/prodect_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  gotosecondScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: ((context) => const ProdectScreen())));
  }

  @override
  Widget build(BuildContext context) {
    gotosecondScreen(context);
    return const SafeArea(
        child: Scaffold(
      body: Center(
          child: Text(
        "walcome to Shop",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      )),
    ));
  }
}
