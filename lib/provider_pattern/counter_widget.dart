import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.model.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Text('${context.watch<CounterModel>().counter}', style: Theme.of(context).textTheme.headline4),
          ElevatedButton(onPressed: context.read<CounterModel>().increment, child: const Text('Press me!'))
        ],
      ),
    );
  }
}
