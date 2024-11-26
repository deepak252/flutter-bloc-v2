import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 24,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
