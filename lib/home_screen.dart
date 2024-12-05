import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/notes');
          },
          child: const Text('Notes Screen')),
    );
  }
}
