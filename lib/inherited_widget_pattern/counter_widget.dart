import 'package:flutter/material.dart';

import 'my_inherited_widget.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.state;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Text('${state.counter}', style: Theme.of(context).textTheme.headline4),
          ElevatedButton(onPressed: state.incrementCounter, child: const Text('Press me!'))
        ],
      ),
    );
  }
}
