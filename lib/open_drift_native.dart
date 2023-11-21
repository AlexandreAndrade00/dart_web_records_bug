import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

LazyDatabase connect() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    String dbFolder;

    try {
      dbFolder = (await getApplicationDocumentsDirectory()).path;
    } catch (e) {
      dbFolder = '.';
    }

    final file = File(p.join(dbFolder, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
