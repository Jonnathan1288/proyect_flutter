import 'package:flutter/material.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: const Center(
        child: Text("Hola como esta"),
      ),
    );
  }
}
