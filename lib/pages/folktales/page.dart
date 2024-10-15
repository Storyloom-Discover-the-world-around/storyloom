import 'package:flutter/material.dart';

class FolktalesPage extends StatelessWidget {
  const FolktalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String country =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'All';

    return Scaffold(
      body: Center(
        child: Text(
          'Folktales for: $country',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
