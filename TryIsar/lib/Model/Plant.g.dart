// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Plant.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlantCollection on Isar {
  IsarCollection<Plant> get plants => this.collection();
}

const PlantSchema = CollectionSchema(
  name: r'Plant',
  id: 3202799289401311532,
  properties: {
    r'CreateDateTime': PropertySchema(
      id: 0,
      name: r'CreateDateTime',
      type: IsarType.string,
    ),
    r'ImagePath': PropertySchema(
      id: 1,
      name: r'ImagePath',
      type: IsarType.string,
    ),
    r'PlantAttack': PropertySchema(
      id: 2,
      name: r'PlantAttack',
      type: IsarType.string,
    ),
    r'PlantAttackSpeed': PropertySchema(
      id: 3,
      name: r'PlantAttackSpeed',
      type: IsarType.string,
    ),
    r'PlantHp': PropertySchema(
      id: 4,
      name: r'PlantHp',
      type: IsarType.string,
    ),
    r'PlantName': PropertySchema(
      id: 5,
      name: r'PlantName',
      type: IsarType.string,
    )
  },
  estimateSize: _plantEstimateSize,
  serialize: _plantSerialize,
  deserialize: _plantDeserialize,
  deserializeProp: _plantDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _plantGetId,
  getLinks: _plantGetLinks,
  attach: _plantAttach,
  version: '3.1.0+1',
);

int _plantEstimateSize(
  Plant object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.CreateDateTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ImagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.PlantAttack;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.PlantAttackSpeed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.PlantHp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.PlantName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _plantSerialize(
  Plant object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.CreateDateTime);
  writer.writeString(offsets[1], object.ImagePath);
  writer.writeString(offsets[2], object.PlantAttack);
  writer.writeString(offsets[3], object.PlantAttackSpeed);
  writer.writeString(offsets[4], object.PlantHp);
  writer.writeString(offsets[5], object.PlantName);
}

Plant _plantDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plant();
  object.CreateDateTime = reader.readStringOrNull(offsets[0]);
  object.ImagePath = reader.readStringOrNull(offsets[1]);
  object.PlantAttack = reader.readStringOrNull(offsets[2]);
  object.PlantAttackSpeed = reader.readStringOrNull(offsets[3]);
  object.PlantHp = reader.readStringOrNull(offsets[4]);
  object.PlantName = reader.readStringOrNull(offsets[5]);
  object.id = id;
  return object;
}

P _plantDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plantGetId(Plant object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plantGetLinks(Plant object) {
  return [];
}

void _plantAttach(IsarCollection<dynamic> col, Id id, Plant object) {
  object.id = id;
}

extension PlantQueryWhereSort on QueryBuilder<Plant, Plant, QWhere> {
  QueryBuilder<Plant, Plant, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlantQueryWhere on QueryBuilder<Plant, Plant, QWhereClause> {
  QueryBuilder<Plant, Plant, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlantQueryFilter on QueryBuilder<Plant, Plant, QFilterCondition> {
  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'CreateDateTime',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'CreateDateTime',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'CreateDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'CreateDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'CreateDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'CreateDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'CreateDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'CreateDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'CreateDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'CreateDateTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'CreateDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createDateTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'CreateDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ImagePath',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ImagePath',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ImagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ImagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PlantAttack',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PlantAttack',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantAttack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PlantAttack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PlantAttack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PlantAttack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'PlantAttack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'PlantAttack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'PlantAttack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'PlantAttack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantAttack',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'PlantAttack',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PlantAttackSpeed',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      plantAttackSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PlantAttackSpeed',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PlantAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PlantAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PlantAttackSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'PlantAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'PlantAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'PlantAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'PlantAttackSpeed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantAttackSpeedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantAttackSpeed',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      plantAttackSpeedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'PlantAttackSpeed',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PlantHp',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PlantHp',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PlantHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PlantHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PlantHp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'PlantHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'PlantHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'PlantHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'PlantHp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantHp',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantHpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'PlantHp',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PlantName',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PlantName',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PlantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PlantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PlantName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'PlantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'PlantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'PlantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'PlantName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PlantName',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'PlantName',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlantQueryObject on QueryBuilder<Plant, Plant, QFilterCondition> {}

extension PlantQueryLinks on QueryBuilder<Plant, Plant, QFilterCondition> {}

extension PlantQuerySortBy on QueryBuilder<Plant, Plant, QSortBy> {
  QueryBuilder<Plant, Plant, QAfterSortBy> sortByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttack', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttack', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantAttackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttackSpeed', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantAttackSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttackSpeed', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantHp', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantHp', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantName', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantName', Sort.desc);
    });
  }
}

extension PlantQuerySortThenBy on QueryBuilder<Plant, Plant, QSortThenBy> {
  QueryBuilder<Plant, Plant, QAfterSortBy> thenByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttack', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttack', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantAttackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttackSpeed', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantAttackSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantAttackSpeed', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantHp', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantHp', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantName', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PlantName', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension PlantQueryWhereDistinct on QueryBuilder<Plant, Plant, QDistinct> {
  QueryBuilder<Plant, Plant, QDistinct> distinctByCreateDateTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'CreateDateTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ImagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByPlantAttack(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PlantAttack', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByPlantAttackSpeed(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PlantAttackSpeed',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByPlantHp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PlantHp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByPlantName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PlantName', caseSensitive: caseSensitive);
    });
  }
}

extension PlantQueryProperty on QueryBuilder<Plant, Plant, QQueryProperty> {
  QueryBuilder<Plant, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Plant, String?, QQueryOperations> CreateDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'CreateDateTime');
    });
  }

  QueryBuilder<Plant, String?, QQueryOperations> ImagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ImagePath');
    });
  }

  QueryBuilder<Plant, String?, QQueryOperations> PlantAttackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PlantAttack');
    });
  }

  QueryBuilder<Plant, String?, QQueryOperations> PlantAttackSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PlantAttackSpeed');
    });
  }

  QueryBuilder<Plant, String?, QQueryOperations> PlantHpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PlantHp');
    });
  }

  QueryBuilder<Plant, String?, QQueryOperations> PlantNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PlantName');
    });
  }
}
