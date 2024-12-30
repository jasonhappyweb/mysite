// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Page1.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPage1Collection on Isar {
  IsarCollection<Page1> get page1s => this.collection();
}

const Page1Schema = CollectionSchema(
  name: r'Page1',
  id: -1890479022730100144,
  properties: {
    r'Line': PropertySchema(
      id: 0,
      name: r'Line',
      type: IsarType.string,
    ),
    r'People': PropertySchema(
      id: 1,
      name: r'People',
      type: IsarType.string,
    ),
    r'Talk': PropertySchema(
      id: 2,
      name: r'Talk',
      type: IsarType.string,
    ),
    r'Times': PropertySchema(
      id: 3,
      name: r'Times',
      type: IsarType.string,
    ),
    r'USerNMC': PropertySchema(
      id: 4,
      name: r'USerNMC',
      type: IsarType.string,
    )
  },
  estimateSize: _page1EstimateSize,
  serialize: _page1Serialize,
  deserialize: _page1Deserialize,
  deserializeProp: _page1DeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _page1GetId,
  getLinks: _page1GetLinks,
  attach: _page1Attach,
  version: '3.1.0+1',
);

int _page1EstimateSize(
  Page1 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.Line;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.People;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.Talk;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.Times;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.UserNMC;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _page1Serialize(
  Page1 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.Line);
  writer.writeString(offsets[1], object.People);
  writer.writeString(offsets[2], object.Talk);
  writer.writeString(offsets[3], object.Times);
  writer.writeString(offsets[4], object.UserNMC);
}

Page1 _page1Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Page1();
  object.Line = reader.readStringOrNull(offsets[0]);
  object.People = reader.readStringOrNull(offsets[1]);
  object.Talk = reader.readStringOrNull(offsets[2]);
  object.Times = reader.readStringOrNull(offsets[3]);
  object.UserNMC = reader.readStringOrNull(offsets[4]);
  object.id = id;
  return object;
}

P _page1DeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _page1GetId(Page1 object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _page1GetLinks(Page1 object) {
  return [];
}

void _page1Attach(IsarCollection<dynamic> col, Id id, Page1 object) {
  object.id = id;
}

extension Page1QueryWhereSort on QueryBuilder<Page1, Page1, QWhere> {
  QueryBuilder<Page1, Page1, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Page1QueryWhere on QueryBuilder<Page1, Page1, QWhereClause> {
  QueryBuilder<Page1, Page1, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Page1, Page1, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Page1, Page1, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Page1, Page1, QAfterWhereClause> idBetween(
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

extension Page1QueryFilter on QueryBuilder<Page1, Page1, QFilterCondition> {
  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Line',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Line',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Line',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Line',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Line',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Line',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Line',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Line',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Line',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Line',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Line',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> lineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Line',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'People',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'People',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'People',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'People',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'People',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'People',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'People',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'People',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'People',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'People',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'People',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> peopleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'People',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Talk',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Talk',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Talk',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Talk',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Talk',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Talk',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Talk',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Talk',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Talk',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Talk',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Talk',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> talkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Talk',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Times',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Times',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Times',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Times',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Times',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Times',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Times',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Times',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Times',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Times',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Times',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> timesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Times',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'USerNMC',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'USerNMC',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'USerNMC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'USerNMC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'USerNMC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'USerNMC',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'USerNMC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'USerNMC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'USerNMC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'USerNMC',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'USerNMC',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> userNMCIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'USerNMC',
        value: '',
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Page1, Page1, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Page1, Page1, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Page1, Page1, QAfterFilterCondition> idBetween(
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

extension Page1QueryObject on QueryBuilder<Page1, Page1, QFilterCondition> {}

extension Page1QueryLinks on QueryBuilder<Page1, Page1, QFilterCondition> {}

extension Page1QuerySortBy on QueryBuilder<Page1, Page1, QSortBy> {
  QueryBuilder<Page1, Page1, QAfterSortBy> sortByLine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Line', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByLineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Line', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'People', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'People', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByTalk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Talk', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByTalkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Talk', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Times', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Times', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByUserNMC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'USerNMC', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> sortByUserNMCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'USerNMC', Sort.desc);
    });
  }
}

extension Page1QuerySortThenBy on QueryBuilder<Page1, Page1, QSortThenBy> {
  QueryBuilder<Page1, Page1, QAfterSortBy> thenByLine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Line', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByLineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Line', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'People', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'People', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByTalk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Talk', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByTalkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Talk', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Times', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Times', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByUserNMC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'USerNMC', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByUserNMCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'USerNMC', Sort.desc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Page1, Page1, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension Page1QueryWhereDistinct on QueryBuilder<Page1, Page1, QDistinct> {
  QueryBuilder<Page1, Page1, QDistinct> distinctByLine(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Line', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Page1, Page1, QDistinct> distinctByPeople(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'People', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Page1, Page1, QDistinct> distinctByTalk(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Talk', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Page1, Page1, QDistinct> distinctByTimes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Times', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Page1, Page1, QDistinct> distinctByUserNMC(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'USerNMC', caseSensitive: caseSensitive);
    });
  }
}

extension Page1QueryProperty on QueryBuilder<Page1, Page1, QQueryProperty> {
  QueryBuilder<Page1, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Page1, String?, QQueryOperations> LineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Line');
    });
  }

  QueryBuilder<Page1, String?, QQueryOperations> PeopleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'People');
    });
  }

  QueryBuilder<Page1, String?, QQueryOperations> TalkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Talk');
    });
  }

  QueryBuilder<Page1, String?, QQueryOperations> TimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Times');
    });
  }

  QueryBuilder<Page1, String?, QQueryOperations> UserNMCProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'USerNMC');
    });
  }
}
