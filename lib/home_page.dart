import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/cubit/counter_cubit.dart';

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
            // BlocBuilder: A widget that helps re-building the UI based on bloc state changes
            BlocBuilder<CounterCubit, CounterState>(
                // buildWhen: (prevState, currState) {
                //   // Return true/false to determine whether or not to rebuild the widget with state
                //   return true;
                // },
                builder: (context, state) {
              // return widget here based on Bloc State
              // the builder function can be called MULTIPLE TIMES (bcoz of flutter engine)
              return Text(
                "${state.counterValue}",
                style: const TextStyle(fontSize: 30),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // // Without extensions
                    // BlocProvider.of<CounterCubit>(context).decrement();
                    // // with extensions
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 24,
                ),
                FloatingActionButton(
                  onPressed: () {
                    // // Without extensions
                    // BlocProvider.of<CounterCubit>(context).increment();
                    // // with extensions
                    context.read<CounterCubit>().increment();
                  },
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
