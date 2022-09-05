import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Center(child: Text('$count', style: Theme.of(context).textTheme.headline4));
            },
          ),
          ElevatedButton(onPressed: context.read<CounterCubit>().increment, child: const Text('Press me!'))
        ],
      ),
    );
  }
}
