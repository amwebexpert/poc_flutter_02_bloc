import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.model.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('BLoC => Model:'),
          BlocBuilder<CounterModel, int>(
            builder: (context, count) {
              return Center(child: Text('$count', style: Theme.of(context).textTheme.headline4));
            },
          ),
          ElevatedButton(onPressed: context.read<CounterModel>().increment, child: const Text('Press me!'))
        ],
      ),
    );
  }
}
