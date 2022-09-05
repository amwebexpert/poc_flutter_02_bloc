import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.state.dart';
import 'counter_page.dart';

class CounterAppWithProvider extends StatelessWidget {
  const CounterAppWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterState(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: const CounterPage(),
      ),
    );
  }
}
