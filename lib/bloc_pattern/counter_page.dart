import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.cubit.dart';
import 'counter_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter BLoC pattern')),
      // react to state changes with BlocBuilder (rebuild the widget in response to new states)
      body: const CounterWidget(),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
