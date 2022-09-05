import 'package:flutter/material.dart';

import 'counter_page.dart';

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
