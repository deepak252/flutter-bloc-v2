import 'dart:developer';

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
      body: BlocListener<CounterCubit, CounterState>(
        // listenWhen: (prevState, state) {
        //   return state.counterValue % 2 == 0;
        // },
        // this listener function is called only once per state (not including the initial state, i.e, not get called on initial load)
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Incremented'),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Decremented'),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // BlocBuilder: A widget that helps re-building the UI based on bloc state changes
              BlocBuilder<CounterCubit, CounterState>(
                  // buildWhen: (prevState, currState) {
                  //   // Return true/false to determine whether or not to rebuild the widget with state
                  //   return currState.counterValue % 2 == 0;
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
      ),
    );
  }
}
