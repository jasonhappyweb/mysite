// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Zombie.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetZombieCollection on Isar {
  IsarCollection<Zombie> get zombies => this.collection();
}

const ZombieSchema = CollectionSchema(
  name: r'Zombie',
  id: 3477168823811976005,
  properties: {
    r'Attack': PropertySchema(
      id: 0,
      name: r'Attack',
      type: IsarType.string,
    ),
    r'CreateDateTime': PropertySchema(
      id: 1,
      name: r'CreateDateTime',
      type: IsarType.string,
    ),
    r'ImagePath': PropertySchema(
      id: 2,
      name: r'ImagePath',
      type: IsarType.string,
    ),
    r'ZombieAttackSpeed': PropertySchema(
      id: 3,
      name: r'ZombieAttackSpeed',
      type: IsarType.string,
    ),
    r'ZombieHp': PropertySchema(
      id: 4,
      name: r'ZombieHp',
      type: IsarType.string,
    ),
    r'ZombieName': PropertySchema(
      id: 5,
      name: r'ZombieName',
      type: IsarType.string,
    )
  },
  estimateSize: _zombieEstimateSize,
  serialize: _zombieSerialize,
  deserialize: _zombieDeserialize,
  deserializeProp: _zombieDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _zombieGetId,
  getLinks: _zombieGetLinks,
  attach: _zombieAttach,
  version: '3.1.0+1',
);

int _zombieEstimateSize(
  Zombie object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ZombieAttack;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.ZombieAttackSpeed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ZombieHp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ZombieName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _zombieSerialize(
  Zombie object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ZombieAttack);
  writer.writeString(offsets[1], object.CreateDateTime);
  writer.writeString(offsets[2], object.ImagePath);
  writer.writeString(offsets[3], object.ZombieAttackSpeed);
  writer.writeString(offsets[4], object.ZombieHp);
  writer.writeString(offsets[5], object.ZombieName);
}

Zombie _zombieDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Zombie();
  object.ZombieAttack = reader.readStringOrNull(offsets[0]);
  object.CreateDateTime = reader.readStringOrNull(offsets[1]);
  object.ImagePath = reader.readStringOrNull(offsets[2]);
  object.ZombieAttackSpeed = reader.readStringOrNull(offsets[3]);
  object.ZombieHp = reader.readStringOrNull(offsets[4]);
  object.ZombieName = reader.readStringOrNull(offsets[5]);
  object.id = id;
  return object;
}

P _zombieDeserializeProp<P>(
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

Id _zombieGetId(Zombie object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _zombieGetLinks(Zombie object) {
  return [];
}

void _zombieAttach(IsarCollection<dynamic> col, Id id, Zombie object) {
  object.id = id;
}

extension ZombieQueryWhereSort on QueryBuilder<Zombie, Zombie, QWhere> {
  QueryBuilder<Zombie, Zombie, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ZombieQueryWhere on QueryBuilder<Zombie, Zombie, QWhereClause> {
  QueryBuilder<Zombie, Zombie, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Zombie, Zombie, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterWhereClause> idBetween(
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

extension ZombieQueryFilter on QueryBuilder<Zombie, Zombie, QFilterCondition> {
  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Attack',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Attack',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Attack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Attack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Attack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Attack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Attack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Attack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Attack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Attack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Attack',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Attack',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'CreateDateTime',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      createDateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'CreateDateTime',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeEqualTo(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeGreaterThan(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeLessThan(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeBetween(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeStartsWith(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeEndsWith(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeContains(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeMatches(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> createDateTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'CreateDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      createDateTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'CreateDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ImagePath',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ImagePath',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathEqualTo(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathGreaterThan(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathLessThan(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathBetween(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathStartsWith(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathEndsWith(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathContains(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathMatches(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      zombieAttackSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ZombieAttackSpeed',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      zombieAttackSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ZombieAttackSpeed',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackSpeedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ZombieAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      zombieAttackSpeedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ZombieAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackSpeedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ZombieAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackSpeedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ZombieAttackSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      zombieAttackSpeedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ZombieAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackSpeedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ZombieAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackSpeedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ZombieAttackSpeed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieAttackSpeedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ZombieAttackSpeed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      zombieAttackSpeedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ZombieAttackSpeed',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition>
      zombieAttackSpeedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ZombieAttackSpeed',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ZombieHp',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ZombieHp',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ZombieHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ZombieHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ZombieHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ZombieHp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ZombieHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ZombieHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ZombieHp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ZombieHp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ZombieHp',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieHpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ZombieHp',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ZombieName',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ZombieName',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ZombieName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ZombieName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ZombieName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ZombieName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ZombieName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ZombieName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ZombieName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ZombieName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ZombieName',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> zombieNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ZombieName',
        value: '',
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Zombie, Zombie, QAfterFilterCondition> idBetween(
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

extension ZombieQueryObject on QueryBuilder<Zombie, Zombie, QFilterCondition> {}

extension ZombieQueryLinks on QueryBuilder<Zombie, Zombie, QFilterCondition> {}

extension ZombieQuerySortBy on QueryBuilder<Zombie, Zombie, QSortBy> {
  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Attack', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Attack', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieAttackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieAttackSpeed', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieAttackSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieAttackSpeed', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieHp', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieHp', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieName', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> sortByZombieNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieName', Sort.desc);
    });
  }
}

extension ZombieQuerySortThenBy on QueryBuilder<Zombie, Zombie, QSortThenBy> {
  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Attack', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Attack', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'CreateDateTime', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ImagePath', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieAttackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieAttackSpeed', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieAttackSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieAttackSpeed', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieHp', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieHp', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieName', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByZombieNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ZombieName', Sort.desc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Zombie, Zombie, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ZombieQueryWhereDistinct on QueryBuilder<Zombie, Zombie, QDistinct> {
  QueryBuilder<Zombie, Zombie, QDistinct> distinctByZombieAttack(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Attack', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Zombie, Zombie, QDistinct> distinctByCreateDateTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'CreateDateTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Zombie, Zombie, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ImagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Zombie, Zombie, QDistinct> distinctByZombieAttackSpeed(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ZombieAttackSpeed',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Zombie, Zombie, QDistinct> distinctByZombieHp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ZombieHp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Zombie, Zombie, QDistinct> distinctByZombieName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ZombieName', caseSensitive: caseSensitive);
    });
  }
}

extension ZombieQueryProperty on QueryBuilder<Zombie, Zombie, QQueryProperty> {
  QueryBuilder<Zombie, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Zombie, String?, QQueryOperations> ZombieAttackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Attack');
    });
  }

  QueryBuilder<Zombie, String?, QQueryOperations> CreateDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'CreateDateTime');
    });
  }

  QueryBuilder<Zombie, String?, QQueryOperations> ImagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ImagePath');
    });
  }

  QueryBuilder<Zombie, String?, QQueryOperations> ZombieAttackSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ZombieAttackSpeed');
    });
  }

  QueryBuilder<Zombie, String?, QQueryOperations> ZombieHpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ZombieHp');
    });
  }

  QueryBuilder<Zombie, String?, QQueryOperations> ZombieNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ZombieName');
    });
  }
}
