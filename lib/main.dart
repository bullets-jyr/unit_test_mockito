import 'package:flutter/material.dart';

import 'home_screen.dart';

// Mock dependencies using Mockito
// https://docs.flutter.dev/cookbook/testing/unit/mocking

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
