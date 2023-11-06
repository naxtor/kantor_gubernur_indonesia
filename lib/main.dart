import 'package:flutter/material.dart';
import 'package:kantor_gubernur_indonesia/screens/splash_screen.dart';

void main() {
  runApp(const KantorGubernur());
}

class KantorGubernur extends StatelessWidget {
  const KantorGubernur({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
