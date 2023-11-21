import 'dart:convert';

import 'package:drift/drift.dart';

import 'models.dart';

class DriftConverters {
  static ({OCPropertyKeyDrift key, List<OCPropertyValueDrift> values})
      cypherLiteralConverterToDrift(
          {required type,
          int index = 0,
          String? key,
          OCPropertyKeyDrift? propKey,
          String? nodeId,
          LiteralStruct? literalStruct = LiteralStruct.none}) {
    assert(key != null || propKey != null, "At least one should be provided");

    propKey ??= OCPropertyKeyDrift.init(
      key: key!,
      literalStruct: literalStruct!,
      nodeId: nodeId,
    );

    if (type is List) {
      return cypherLiteralListConverterToDrift(type, propKey);
    }

    switch (type.runtimeType) {
      case int:
        return (
          key: propKey,
          values: [
            OCPropertyValueDrift(
              index: index,
              keyId: propKey.id,
              intValue: (type as int),
            )
          ]
        );

      case double:
        return (
          key: propKey,
          values: [
            OCPropertyValueDrift(
              index: index,
              keyId: propKey.id,
              doubleValue: (type as double),
            )
          ]
        );

      case String:
        return (
          key: propKey,
          values: [
            OCPropertyValueDrift(
              index: index,
              keyId: propKey.id,
              stringValue: (type as String),
            )
          ]
        );

      case bool:
        return (
          key: propKey,
          values: [
            OCPropertyValueDrift(
              index: index,
              keyId: propKey.id,
              boolValue: (type as bool),
            )
          ]
        );

      case Null:
        return (
          key: propKey,
          values: [
            OCPropertyValueDrift(
              index: index,
              keyId: propKey.id,
            )
          ]
        );

      default:
        throw const FormatException("Invalid Property type");
    }
  }

  static ({OCPropertyKeyDrift key, List<OCPropertyValueDrift> values})
      cypherLiteralListConverterToDrift(List list, OCPropertyKeyDrift propKey) {
    propKey = propKey.copyWith(literalStruct: LiteralStruct.list);

    List<OCPropertyValueDrift> convertedList = [];

    for (final (index, elem) in list.indexed) {
      final convertedType = cypherLiteralConverterToDrift(
          type: elem, propKey: propKey, index: index);

      convertedList.add(convertedType.values.first);
    }

    return (key: propKey, values: convertedList);
  }
}

class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) =>
      ((json.decode(fromDb) as Map<String, dynamic>)['list'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

  @override
  String toSql(List<String> value) => json.encode({'list': value});
}
