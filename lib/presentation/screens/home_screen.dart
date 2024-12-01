import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('Render HomeScreen');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(builder: (_, state) {
              log('Render Counter1');
              return Text(
                'Counter1: ${state.counterValue}',
                style: const TextStyle(fontSize: 24),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            // Below code will cause render of Entire HomeScreen on counter state change,
            // even if state changes from the second screen.
            // Text( // Bad
            //   'Counter2: ${context.watch<CounterCubit>().state.counterValue}',
            //   style: const TextStyle(fontSize: 24),
            // ),

            // Only builder will get rebuild on counter state change.
            Builder(builder: (ctx) {
              // Good
              // context.watch: builder will rebuild even 'wasIncremented' value not changed but CounterState changes
              log('Render Counter2');
              return Text(
                'Counter2: ${ctx.watch<CounterCubit>().state.wasIncremented}',
                style: const TextStyle(fontSize: 24),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Builder(builder: (ctx) {
              // Recommended
              // context.select: builder will rebuild only whenever 'wasIncremented' changes.
              log('Render Counter3');
              final counterValue =
                  ctx.select((CounterCubit cubit) => cubit.state.wasIncremented);
              return Text(
                'Counter3: $counterValue',
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
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  // Named Routing
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Second Page'))
          ],
        ),
      ),
    );
  }
}
