import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'drift_db.dart';
import 'models.dart';

Future<void> main() async {
  DriftDB();

  Future<int> work() async {
    final nodes = List.filled(
        1,
        OCNode(const Uuid().v1(), ["node"], {"hello": "bye", "123": "456"},
            ["23123", "3312"], ["23123", "3312"]));

    final List<Future> futures = [];

    for (var element in nodes) {
      futures.add(DriftDB().saveNode(element));
    }

    await Future.wait(futures);

    return 0;
  }

  await work();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Is Working!"),
        ),
      ),
    );
  }
}
