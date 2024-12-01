import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(builder: (_, state) {
              return Text(
                '${state.counterValue}',
                style: const TextStyle(fontSize: 24),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 1,
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 24,
                ),
                FloatingActionButton(
                  heroTag: 2,
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
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
