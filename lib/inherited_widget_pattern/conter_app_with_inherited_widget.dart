import 'package:flutter/material.dart';

import 'counter_widget.dart';

class MyInheritedWidget extends InheritedWidget {
  final CounterPageState state;

  const MyInheritedWidget({super.key, required this.state, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class CounterAppWithInheritedWidget extends StatelessWidget {
  const CounterAppWithInheritedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

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
