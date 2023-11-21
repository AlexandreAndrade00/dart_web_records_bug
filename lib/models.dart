import 'package:drift/drift.dart';

import '../drift_db.dart';
import 'converters.dart';

@UseRowClass(OCNodeDrift)
class OCNodesDrift extends Table {
  TextColumn get id => text()();

  TextColumn get labels => text().map(StringListConverter()).nullable()();

  TextColumn get inRelationshipsIds => text().map(StringListConverter())();

  TextColumn get outRelationshipsIds => text().map(StringListConverter())();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class OCNodeDrift implements Insertable<OCNodeDrift> {
  final String id;

  final List<String>? labels;

  final List<String> inRelationshipsIds;

  final List<String> outRelationshipsIds;

  OCNodeDrift(
      this.id, this.labels, this.inRelationshipsIds, this.outRelationshipsIds);

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) =>
      OCNodesDriftCompanion(
        id: Value(id),
        labels: Value(labels),
        inRelationshipsIds: Value(inRelationshipsIds),
        outRelationshipsIds: Value(outRelationshipsIds),
      ).toColumns(nullToAbsent);
}

enum LiteralStruct { none, list, map }

@UseRowClass(OCPropertyKeyDrift, generateInsertable: true)
class OCPropertyKeysDrift extends Table {
  IntColumn get id => integer()();

  TextColumn get nodeId => text()
      .nullable()
      .references(OCNodesDrift, #id, onDelete: KeyAction.cascade)();

  TextColumn get key => text()();

  TextColumn get literalStruct => textEnum<LiteralStruct>()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class OCPropertyKeyDrift {
  // hash generated from entity id and key
  final int id;

  String get entityId => nodeId!;

  final String? nodeId;

  final String key;

  final LiteralStruct literalStruct;

  OCPropertyKeyDrift({
    required this.id,
    required this.key,
    required this.literalStruct,
    this.nodeId,
  });

  OCPropertyKeyDrift.init({
    required this.key,
    this.literalStruct = LiteralStruct.none,
    required this.nodeId,
  }) : id = (key + (nodeId!)).hashCode;

  OCPropertyKeyDrift copyWith({
    String? key,
    LiteralStruct? literalStruct,
    String? nodeId,
    String? relationId,
  }) =>
      OCPropertyKeyDrift(
        id: id,
        literalStruct: literalStruct ?? this.literalStruct,
        key: key ?? this.key,
        nodeId: nodeId ?? this.nodeId,
      );
}

@UseRowClass(OCPropertyValueDrift, generateInsertable: true)
class OCPropertyValuesDrift extends Table {
  IntColumn get index => integer()();

  IntColumn get keyId => integer()
      .references(OCPropertyKeysDrift, #id, onDelete: KeyAction.cascade)();

  IntColumn get intValue => integer().nullable()();

  RealColumn get doubleValue => real().nullable()();

  TextColumn get stringValue => text().nullable()();

  BoolColumn get boolValue => boolean().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {keyId, index};
}

class OCPropertyValueDrift {
  final int index;

  final int keyId;

  final int? intValue;
  final double? doubleValue;
  final String? stringValue;
  final bool? boolValue;

  OCPropertyValueDrift({
    required this.index,
    required this.keyId,
    this.intValue,
    this.doubleValue,
    this.stringValue,
    this.boolValue,
  });
}

class OCNode {
  final String id;

  final Map? properties;

  final List<String>? labels;

  final List<String> inRelationshipsIds;

  final List<String> outRelationshipsIds;

  OCNode(this.id, this.labels, this.properties, this.inRelationshipsIds,
      this.outRelationshipsIds);
}
