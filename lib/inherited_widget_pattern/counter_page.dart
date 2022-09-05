import 'package:flutter/material.dart';

import 'counter_widget.dart';
import 'my_inherited_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() => counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Inherited Widget pattern')),
      body: MyInheritedWidget(state: this, child: const CounterWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
