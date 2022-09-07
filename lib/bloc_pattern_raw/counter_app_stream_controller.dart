import 'package:flutter/material.dart';
import 'counter_events.dart';
import 'counter_bloc.dart';

class CounterAppWithRawBloc extends StatefulWidget {
  const CounterAppWithRawBloc({super.key});

  @override
  State<CounterAppWithRawBloc> createState() => _CounterAppWithRawBlocState();
}

class _CounterAppWithRawBlocState extends State<CounterAppWithRawBloc> {
  final CounterBloc bloc = CounterBloc();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stream demo')),
        body: StreamBuilder<int>(
            stream: bloc.counter,
            initialData: 0,
            builder: (context, snapshot) {
              final count = snapshot.data ?? 0;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Counter: $count')),
                  ElevatedButton(
                      onPressed: () => bloc.counterEventSync.add(IncrementEvent()), child: const Text('Increment'))
                ],
              );
            }),
      ),
    );
  }
}
