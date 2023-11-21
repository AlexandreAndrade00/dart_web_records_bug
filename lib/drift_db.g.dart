// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $OCNodesDriftTable extends OCNodesDrift
    with TableInfo<$OCNodesDriftTable, OCNodeDrift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OCNodesDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelsMeta = const VerificationMeta('labels');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> labels =
      GeneratedColumn<String>('labels', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($OCNodesDriftTable.$converterlabelsn);
  static const VerificationMeta _inRelationshipsIdsMeta =
      const VerificationMeta('inRelationshipsIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      inRelationshipsIds = GeneratedColumn<String>(
              'in_relationships_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $OCNodesDriftTable.$converterinRelationshipsIds);
  static const VerificationMeta _outRelationshipsIdsMeta =
      const VerificationMeta('outRelationshipsIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      outRelationshipsIds = GeneratedColumn<String>(
              'out_relationships_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $OCNodesDriftTable.$converteroutRelationshipsIds);
  @override
  List<GeneratedColumn> get $columns =>
      [id, labels, inRelationshipsIds, outRelationshipsIds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'o_c_nodes_drift';
  @override
  VerificationContext validateIntegrity(Insertable<OCNodeDrift> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    context.handle(_labelsMeta, const VerificationResult.success());
    context.handle(_inRelationshipsIdsMeta, const VerificationResult.success());
    context.handle(
        _outRelationshipsIdsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OCNodeDrift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OCNodeDrift(
      attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      $OCNodesDriftTable.$converterlabelsn.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}labels'])),
      $OCNodesDriftTable.$converterinRelationshipsIds.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}in_relationships_ids'])!),
      $OCNodesDriftTable.$converteroutRelationshipsIds.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}out_relationships_ids'])!),
    );
  }

  @override
  $OCNodesDriftTable createAlias(String alias) {
    return $OCNodesDriftTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterlabels =
      StringListConverter();
  static TypeConverter<List<String>?, String?> $converterlabelsn =
      NullAwareTypeConverter.wrap($converterlabels);
  static TypeConverter<List<String>, String> $converterinRelationshipsIds =
      StringListConverter();
  static TypeConverter<List<String>, String> $converteroutRelationshipsIds =
      StringListConverter();
}

class OCNodesDriftCompanion extends UpdateCompanion<OCNodeDrift> {
  final Value<String> id;
  final Value<List<String>?> labels;
  final Value<List<String>> inRelationshipsIds;
  final Value<List<String>> outRelationshipsIds;
  final Value<int> rowid;
  const OCNodesDriftCompanion({
    this.id = const Value.absent(),
    this.labels = const Value.absent(),
    this.inRelationshipsIds = const Value.absent(),
    this.outRelationshipsIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OCNodesDriftCompanion.insert({
    required String id,
    this.labels = const Value.absent(),
    required List<String> inRelationshipsIds,
    required List<String> outRelationshipsIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        inRelationshipsIds = Value(inRelationshipsIds),
        outRelationshipsIds = Value(outRelationshipsIds);
  static Insertable<OCNodeDrift> custom({
    Expression<String>? id,
    Expression<String>? labels,
    Expression<String>? inRelationshipsIds,
    Expression<String>? outRelationshipsIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (labels != null) 'labels': labels,
      if (inRelationshipsIds != null)
        'in_relationships_ids': inRelationshipsIds,
      if (outRelationshipsIds != null)
        'out_relationships_ids': outRelationshipsIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OCNodesDriftCompanion copyWith(
      {Value<String>? id,
      Value<List<String>?>? labels,
      Value<List<String>>? inRelationshipsIds,
      Value<List<String>>? outRelationshipsIds,
      Value<int>? rowid}) {
    return OCNodesDriftCompanion(
      id: id ?? this.id,
      labels: labels ?? this.labels,
      inRelationshipsIds: inRelationshipsIds ?? this.inRelationshipsIds,
      outRelationshipsIds: outRelationshipsIds ?? this.outRelationshipsIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (labels.present) {
      final converter = $OCNodesDriftTable.$converterlabelsn;

      map['labels'] = Variable<String>(converter.toSql(labels.value));
    }
    if (inRelationshipsIds.present) {
      final converter = $OCNodesDriftTable.$converterinRelationshipsIds;

      map['in_relationships_ids'] =
          Variable<String>(converter.toSql(inRelationshipsIds.value));
    }
    if (outRelationshipsIds.present) {
      final converter = $OCNodesDriftTable.$converteroutRelationshipsIds;

      map['out_relationships_ids'] =
          Variable<String>(converter.toSql(outRelationshipsIds.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OCNodesDriftCompanion(')
          ..write('id: $id, ')
          ..write('labels: $labels, ')
          ..write('inRelationshipsIds: $inRelationshipsIds, ')
          ..write('outRelationshipsIds: $outRelationshipsIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OCPropertyKeysDriftTable extends OCPropertyKeysDrift
    with TableInfo<$OCPropertyKeysDriftTable, OCPropertyKeyDrift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OCPropertyKeysDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES o_c_nodes_drift (id) ON DELETE CASCADE'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _literalStructMeta =
      const VerificationMeta('literalStruct');
  @override
  late final GeneratedColumnWithTypeConverter<LiteralStruct, String>
      literalStruct = GeneratedColumn<String>(
              'literal_struct', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LiteralStruct>(
              $OCPropertyKeysDriftTable.$converterliteralStruct);
  @override
  List<GeneratedColumn> get $columns => [id, nodeId, key, literalStruct];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'o_c_property_keys_drift';
  @override
  VerificationContext validateIntegrity(Insertable<OCPropertyKeyDrift> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    context.handle(_literalStructMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OCPropertyKeyDrift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OCPropertyKeyDrift(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      literalStruct: $OCPropertyKeysDriftTable.$converterliteralStruct.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}literal_struct'])!),
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
    );
  }

  @override
  $OCPropertyKeysDriftTable createAlias(String alias) {
    return $OCPropertyKeysDriftTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LiteralStruct, String, String>
      $converterliteralStruct =
      const EnumNameConverter<LiteralStruct>(LiteralStruct.values);
}

class OCPropertyKeysDriftCompanion extends UpdateCompanion<OCPropertyKeyDrift> {
  final Value<int> id;
  final Value<String?> nodeId;
  final Value<String> key;
  final Value<LiteralStruct> literalStruct;
  const OCPropertyKeysDriftCompanion({
    this.id = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.key = const Value.absent(),
    this.literalStruct = const Value.absent(),
  });
  OCPropertyKeysDriftCompanion.insert({
    this.id = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String key,
    required LiteralStruct literalStruct,
  })  : key = Value(key),
        literalStruct = Value(literalStruct);
  static Insertable<OCPropertyKeyDrift> custom({
    Expression<int>? id,
    Expression<String>? nodeId,
    Expression<String>? key,
    Expression<String>? literalStruct,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (key != null) 'key': key,
      if (literalStruct != null) 'literal_struct': literalStruct,
    });
  }

  OCPropertyKeysDriftCompanion copyWith(
      {Value<int>? id,
      Value<String?>? nodeId,
      Value<String>? key,
      Value<LiteralStruct>? literalStruct}) {
    return OCPropertyKeysDriftCompanion(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      key: key ?? this.key,
      literalStruct: literalStruct ?? this.literalStruct,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (literalStruct.present) {
      final converter = $OCPropertyKeysDriftTable.$converterliteralStruct;

      map['literal_struct'] =
          Variable<String>(converter.toSql(literalStruct.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OCPropertyKeysDriftCompanion(')
          ..write('id: $id, ')
          ..write('nodeId: $nodeId, ')
          ..write('key: $key, ')
          ..write('literalStruct: $literalStruct')
          ..write(')'))
        .toString();
  }
}

class _$OCPropertyKeyDriftInsertable implements Insertable<OCPropertyKeyDrift> {
  OCPropertyKeyDrift _object;
  _$OCPropertyKeyDriftInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return OCPropertyKeysDriftCompanion(
      id: Value(_object.id),
      key: Value(_object.key),
      literalStruct: Value(_object.literalStruct),
      nodeId: Value(_object.nodeId),
    ).toColumns(false);
  }
}

extension OCPropertyKeyDriftToInsertable on OCPropertyKeyDrift {
  _$OCPropertyKeyDriftInsertable toInsertable() {
    return _$OCPropertyKeyDriftInsertable(this);
  }
}

class $OCPropertyValuesDriftTable extends OCPropertyValuesDrift
    with TableInfo<$OCPropertyValuesDriftTable, OCPropertyValueDrift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OCPropertyValuesDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _keyIdMeta = const VerificationMeta('keyId');
  @override
  late final GeneratedColumn<int> keyId = GeneratedColumn<int>(
      'key_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES o_c_property_keys_drift (id) ON DELETE CASCADE'));
  static const VerificationMeta _intValueMeta =
      const VerificationMeta('intValue');
  @override
  late final GeneratedColumn<int> intValue = GeneratedColumn<int>(
      'int_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _doubleValueMeta =
      const VerificationMeta('doubleValue');
  @override
  late final GeneratedColumn<double> doubleValue = GeneratedColumn<double>(
      'double_value', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _stringValueMeta =
      const VerificationMeta('stringValue');
  @override
  late final GeneratedColumn<String> stringValue = GeneratedColumn<String>(
      'string_value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _boolValueMeta =
      const VerificationMeta('boolValue');
  @override
  late final GeneratedColumn<bool> boolValue = GeneratedColumn<bool>(
      'bool_value', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("bool_value" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [index, keyId, intValue, doubleValue, stringValue, boolValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'o_c_property_values_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<OCPropertyValueDrift> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('key_id')) {
      context.handle(
          _keyIdMeta, keyId.isAcceptableOrUnknown(data['key_id']!, _keyIdMeta));
    } else if (isInserting) {
      context.missing(_keyIdMeta);
    }
    if (data.containsKey('int_value')) {
      context.handle(_intValueMeta,
          intValue.isAcceptableOrUnknown(data['int_value']!, _intValueMeta));
    }
    if (data.containsKey('double_value')) {
      context.handle(
          _doubleValueMeta,
          doubleValue.isAcceptableOrUnknown(
              data['double_value']!, _doubleValueMeta));
    }
    if (data.containsKey('string_value')) {
      context.handle(
          _stringValueMeta,
          stringValue.isAcceptableOrUnknown(
              data['string_value']!, _stringValueMeta));
    }
    if (data.containsKey('bool_value')) {
      context.handle(_boolValueMeta,
          boolValue.isAcceptableOrUnknown(data['bool_value']!, _boolValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {keyId, index};
  @override
  OCPropertyValueDrift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OCPropertyValueDrift(
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      keyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key_id'])!,
      intValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}int_value']),
      doubleValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}double_value']),
      stringValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}string_value']),
      boolValue: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bool_value']),
    );
  }

  @override
  $OCPropertyValuesDriftTable createAlias(String alias) {
    return $OCPropertyValuesDriftTable(attachedDatabase, alias);
  }
}

class OCPropertyValuesDriftCompanion
    extends UpdateCompanion<OCPropertyValueDrift> {
  final Value<int> index;
  final Value<int> keyId;
  final Value<int?> intValue;
  final Value<double?> doubleValue;
  final Value<String?> stringValue;
  final Value<bool?> boolValue;
  final Value<int> rowid;
  const OCPropertyValuesDriftCompanion({
    this.index = const Value.absent(),
    this.keyId = const Value.absent(),
    this.intValue = const Value.absent(),
    this.doubleValue = const Value.absent(),
    this.stringValue = const Value.absent(),
    this.boolValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OCPropertyValuesDriftCompanion.insert({
    required int index,
    required int keyId,
    this.intValue = const Value.absent(),
    this.doubleValue = const Value.absent(),
    this.stringValue = const Value.absent(),
    this.boolValue = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : index = Value(index),
        keyId = Value(keyId);
  static Insertable<OCPropertyValueDrift> custom({
    Expression<int>? index,
    Expression<int>? keyId,
    Expression<int>? intValue,
    Expression<double>? doubleValue,
    Expression<String>? stringValue,
    Expression<bool>? boolValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (index != null) 'index': index,
      if (keyId != null) 'key_id': keyId,
      if (intValue != null) 'int_value': intValue,
      if (doubleValue != null) 'double_value': doubleValue,
      if (stringValue != null) 'string_value': stringValue,
      if (boolValue != null) 'bool_value': boolValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OCPropertyValuesDriftCompanion copyWith(
      {Value<int>? index,
      Value<int>? keyId,
      Value<int?>? intValue,
      Value<double?>? doubleValue,
      Value<String?>? stringValue,
      Value<bool?>? boolValue,
      Value<int>? rowid}) {
    return OCPropertyValuesDriftCompanion(
      index: index ?? this.index,
      keyId: keyId ?? this.keyId,
      intValue: intValue ?? this.intValue,
      doubleValue: doubleValue ?? this.doubleValue,
      stringValue: stringValue ?? this.stringValue,
      boolValue: boolValue ?? this.boolValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (keyId.present) {
      map['key_id'] = Variable<int>(keyId.value);
    }
    if (intValue.present) {
      map['int_value'] = Variable<int>(intValue.value);
    }
    if (doubleValue.present) {
      map['double_value'] = Variable<double>(doubleValue.value);
    }
    if (stringValue.present) {
      map['string_value'] = Variable<String>(stringValue.value);
    }
    if (boolValue.present) {
      map['bool_value'] = Variable<bool>(boolValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OCPropertyValuesDriftCompanion(')
          ..write('index: $index, ')
          ..write('keyId: $keyId, ')
          ..write('intValue: $intValue, ')
          ..write('doubleValue: $doubleValue, ')
          ..write('stringValue: $stringValue, ')
          ..write('boolValue: $boolValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$OCPropertyValueDriftInsertable
    implements Insertable<OCPropertyValueDrift> {
  OCPropertyValueDrift _object;
  _$OCPropertyValueDriftInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return OCPropertyValuesDriftCompanion(
      index: Value(_object.index),
      keyId: Value(_object.keyId),
      intValue: Value(_object.intValue),
      doubleValue: Value(_object.doubleValue),
      stringValue: Value(_object.stringValue),
      boolValue: Value(_object.boolValue),
    ).toColumns(false);
  }
}

extension OCPropertyValueDriftToInsertable on OCPropertyValueDrift {
  _$OCPropertyValueDriftInsertable toInsertable() {
    return _$OCPropertyValueDriftInsertable(this);
  }
}

abstract class _$DriftDB extends GeneratedDatabase {
  _$DriftDB(QueryExecutor e) : super(e);
  late final $OCNodesDriftTable oCNodesDrift = $OCNodesDriftTable(this);
  late final $OCPropertyKeysDriftTable oCPropertyKeysDrift =
      $OCPropertyKeysDriftTable(this);
  late final $OCPropertyValuesDriftTable oCPropertyValuesDrift =
      $OCPropertyValuesDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [oCNodesDrift, oCPropertyKeysDrift, oCPropertyValuesDrift];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('o_c_nodes_drift',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('o_c_property_keys_drift', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('o_c_property_keys_drift',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('o_c_property_values_drift', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
