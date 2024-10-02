// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/hero_widget.dart';

void main() {
  runApp(const StoryLoomApp());
}

class StoryLoomApp extends StatelessWidget {
  const StoryLoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyloom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeroComponent(),
    );
  }
}
