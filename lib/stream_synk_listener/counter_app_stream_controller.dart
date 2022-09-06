// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';

class CounterAppStreamController extends StatefulWidget {
  const CounterAppStreamController({super.key});

  @override
  State<CounterAppStreamController> createState() => _CounterAppStreamControllerState();
}

class _CounterAppStreamControllerState extends State<CounterAppStreamController> {
  final StreamController<int> _counterStreamController = StreamController<int>.broadcast();
  final StreamController<int> _incrementStreamController = StreamController<int>();

  Sink<int> get incrementEventSynk => _incrementStreamController.sink;
  Stream<int> get countStream => _counterStreamController.stream;

  @override
  void initState() {
    super.initState();

    _counterStreamController.onListen = () {
      _counterStreamController.add(0);
    };

    _incrementStreamController.stream.listen((event) {
      _counterStreamController.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stream demo')),
        body: StreamBuilder<int>(
            stream: countStream,
            initialData: 0,
            builder: (context, snapshot) {
              final count = snapshot.data ?? 0;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Counter: $count')),
                  ElevatedButton(
                      onPressed: () => incrementEventSynk.add(count + 5), child: const Text('Increment'))
                ],
              );
            }),
      ),
    );
  }
}
