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
  int counter = 0;
  StreamController<int> counterStreamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    counterStreamController.stream.listen((event) => setState(() {
          counter += event;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stream demo')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Counter: $counter')),
            ElevatedButton(onPressed: () => counterStreamController.add(2), child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}
