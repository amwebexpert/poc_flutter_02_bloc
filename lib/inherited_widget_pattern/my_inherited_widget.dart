import 'package:flutter/material.dart';

import 'counter_page.dart';

class MyInheritedWidget extends InheritedWidget {
  final CounterPageState state;

  const MyInheritedWidget({super.key, required this.state, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print('******* updateShouldNotify');
    return true;
  }
}
