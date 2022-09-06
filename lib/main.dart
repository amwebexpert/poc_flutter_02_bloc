import 'package:flutter/material.dart';
import 'package:poc_flutter_02_bloc/stream_synk_listener/demo.dart';

import 'provider_pattern/conter_app_with_provider.dart';

void main() {
  // runApp(const CounterAppWithProvider());
  // runApp(const CounterAppWithBloc());
  // runApp(const CounterAppWithInheritedWidget());
  runApp(const CounterAppStreamDemo());
}
