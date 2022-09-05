import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: MyInheritedWidget(state: this, child: const CounterWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.state;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${state.counter}',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(onPressed: state.incrementCounter, child: const Text('Press me!'))
        ],
      ),
    );
  }
}
