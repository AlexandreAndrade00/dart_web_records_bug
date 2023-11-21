import 'package:drift/drift.dart';

import 'converters.dart';
import 'models.dart';

import 'open_drift_native.dart' if (dart.library.html) 'open_drift_web.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [
  OCNodesDrift,
  OCPropertyKeysDrift,
  OCPropertyValuesDrift,
])
class DriftDB extends _$DriftDB {
  DriftDB._private() : super(connect());

  @override
  factory DriftDB() => _instance;

  static final DriftDB _instance = DriftDB._private();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> saveNode(OCNode node) async {
    await into(oCNodesDrift).insert(
        OCNodeDrift(node.id, node.labels, node.inRelationshipsIds,
            node.outRelationshipsIds),
        mode: InsertMode.insertOrReplace);

    if (node.properties != null) {
      for (var prop in node.properties!.entries) {
        final literals = DriftConverters.cypherLiteralConverterToDrift(
            type: prop.value, key: prop.key, nodeId: node.id);

        await into(oCPropertyKeysDrift).insert(literals.key.toInsertable(),
            mode: InsertMode.insertOrReplace);

        await batch((batch) => batch.insertAll(
            oCPropertyValuesDrift, literals.values.map((e) => e.toInsertable()),
            mode: InsertMode.insertOrReplace));
      }
    }
  }
}
