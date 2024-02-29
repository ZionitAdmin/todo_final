// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prueba_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPruebaCollection on Isar {
  IsarCollection<Prueba> get pruebas => this.collection();
}

const PruebaSchema = CollectionSchema(
  name: r'Prueba',
  id: 461636395861,
  properties: {
    r'dato': PropertySchema(
      id: 0,
      name: r'dato',
      type: IsarType.string,
    )
  },
  estimateSize: _pruebaEstimateSize,
  serialize: _pruebaSerialize,
  deserialize: _pruebaDeserialize,
  deserializeProp: _pruebaDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pruebaGetId,
  getLinks: _pruebaGetLinks,
  attach: _pruebaAttach,
  version: '3.1.0+1',
);

int _pruebaEstimateSize(
  Prueba object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dato.length * 3;
  return bytesCount;
}

void _pruebaSerialize(
  Prueba object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dato);
}

Prueba _pruebaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Prueba(
    dato: reader.readString(offsets[0]),
    isarId: id,
  );
  return object;
}

P _pruebaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pruebaGetId(Prueba object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _pruebaGetLinks(Prueba object) {
  return [];
}

void _pruebaAttach(IsarCollection<dynamic> col, Id id, Prueba object) {
  object.isarId = id;
}

extension PruebaQueryWhereSort on QueryBuilder<Prueba, Prueba, QWhere> {
  QueryBuilder<Prueba, Prueba, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PruebaQueryWhere on QueryBuilder<Prueba, Prueba, QWhereClause> {
  QueryBuilder<Prueba, Prueba, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PruebaQueryFilter on QueryBuilder<Prueba, Prueba, QFilterCondition> {
  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dato',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dato',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dato',
        value: '',
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> datoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dato',
        value: '',
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PruebaQueryObject on QueryBuilder<Prueba, Prueba, QFilterCondition> {}

extension PruebaQueryLinks on QueryBuilder<Prueba, Prueba, QFilterCondition> {}

extension PruebaQuerySortBy on QueryBuilder<Prueba, Prueba, QSortBy> {
  QueryBuilder<Prueba, Prueba, QAfterSortBy> sortByDato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dato', Sort.asc);
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterSortBy> sortByDatoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dato', Sort.desc);
    });
  }
}

extension PruebaQuerySortThenBy on QueryBuilder<Prueba, Prueba, QSortThenBy> {
  QueryBuilder<Prueba, Prueba, QAfterSortBy> thenByDato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dato', Sort.asc);
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterSortBy> thenByDatoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dato', Sort.desc);
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Prueba, Prueba, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension PruebaQueryWhereDistinct on QueryBuilder<Prueba, Prueba, QDistinct> {
  QueryBuilder<Prueba, Prueba, QDistinct> distinctByDato(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dato', caseSensitive: caseSensitive);
    });
  }
}

extension PruebaQueryProperty on QueryBuilder<Prueba, Prueba, QQueryProperty> {
  QueryBuilder<Prueba, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Prueba, String, QQueryOperations> datoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dato');
    });
  }
}
