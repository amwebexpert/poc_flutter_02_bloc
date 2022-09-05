import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.model.dart';
import 'counter_page.dart';

class CounterAppWithBloc extends StatelessWidget {
  const CounterAppWithBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      // this provides a CounterCubit to the CounterPage
      home: BlocProvider(
        lazy: true,
        create: (_) => CounterModel(),
        child: const CounterPage(),
      ),
    );
  }
}
