import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D211B),
      ),
      body: const Center(
        child: Text(
          'Loading completato!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}