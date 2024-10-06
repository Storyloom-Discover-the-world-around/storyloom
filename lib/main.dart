// lib/main.dart
import 'package:flutter/material.dart';
import 'package:storyloom/widgets/main_layout.dart';

void main() {
  runApp(const StoryLoomApp());
}

class StoryLoomApp extends StatelessWidget {
  const StoryLoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyloom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainLayout(),
    );
  }
}
