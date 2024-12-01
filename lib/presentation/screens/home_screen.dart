import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/constants/enums.dart';
import 'package:flutter_bloc_v2/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_v2/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      // BLOC to BLOC communication using stream listener
      listener: (ctx, state) {
        if (state is InternetConnected) {
          if (state.connectionType == ConnectionType.wifi) {
            ctx.read<CounterCubit>().increment();
          } else if (state.connectionType == ConnectionType.mobile) {
            ctx.read<CounterCubit>().decrement();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
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
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
