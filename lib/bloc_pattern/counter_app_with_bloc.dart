import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.cubit.dart';

class CounterAppWithBloc extends StatelessWidget {
  const CounterAppWithBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this provides a CounterCubit to the CounterPage
      home: BlocProvider(
        lazy: true,
        create: (_) => CounterCubit(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter BLoC pattern')),
      // react to state changes with BlocBuilder (rebuild the widget in response to new states)
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(
            child: Text(
          '$count',
          style: Theme.of(context).textTheme.headline4,
        )),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            // CounterPage widget knows nothing about what happens when a user taps the buttons
            // The widget simply notifies the CounterCubit that the user has triggered increment action
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
