import 'package:flutter/material.dart';
import 'counter_events.dart';
import 'counter_bloc.dart';

class CounterAppWithRawBloc extends StatefulWidget {
  const CounterAppWithRawBloc({super.key});

  @override
  State<CounterAppWithRawBloc> createState() => _CounterAppWithRawBlocState();
}

class _CounterAppWithRawBlocState extends State<CounterAppWithRawBloc> {
  final CounterBloc _bloc = CounterBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Raw Bloc demo')),
        body: StreamBuilder<int>(
            stream: _bloc.counter,
            initialData: 0,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Counter: ${snapshot.data}')),
                  ElevatedButton(
                      onPressed: () => _bloc.counterEventSync.add(IncrementEvent()), child: const Text('Increment')),
                  ElevatedButton(
                      onPressed: () => _bloc.counterEventSync.add(DecrementEvent()), child: const Text('Decrement'))
                ],
              );
            }),
      ),
    );
  }
}
