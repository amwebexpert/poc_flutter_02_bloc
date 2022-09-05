import 'package:flutter/material.dart';
import 'package:poc_flutter_02_bloc/provider_pattern/counter.state.dart';
import 'package:provider/provider.dart';

import 'counter_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Provider pattern')),
      body: const CounterWidget(),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: context.read<CounterState>().increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: context.read<CounterState>().decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
