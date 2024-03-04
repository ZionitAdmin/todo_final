// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_day_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTarjetaCollection on Isar {
  IsarCollection<Tarjeta> get tarjeta => this.collection();
}

const TarjetaSchema = CollectionSchema(
  name: r'Tarjeta',
  id: -3367504161800744515,
  properties: {
    r'descripcion': PropertySchema(
      id: 0,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'fechaLimite': PropertySchema(
      id: 1,
      name: r'fechaLimite',
      type: IsarType.dateTime,
    ),
    r'fechaRealizacion': PropertySchema(
      id: 2,
      name: r'fechaRealizacion',
      type: IsarType.dateTime,
    ),
    r'integrantes': PropertySchema(
      id: 3,
      name: r'integrantes',
      type: IsarType.stringList,
    ),
    r'proyectos': PropertySchema(
      id: 4,
      name: r'proyectos',
      type: IsarType.stringList,
    ),
    r'titulo': PropertySchema(
      id: 5,
      name: r'titulo',
      type: IsarType.string,
    )
  },
  estimateSize: _tarjetaEstimateSize,
  serialize: _tarjetaSerialize,
  deserialize: _tarjetaDeserialize,
  deserializeProp: _tarjetaDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tarjetaGetId,
  getLinks: _tarjetaGetLinks,
  attach: _tarjetaAttach,
  version: '3.1.0+1',
);

int _tarjetaEstimateSize(
  Tarjeta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.integrantes.length * 3;
  {
    for (var i = 0; i < object.integrantes.length; i++) {
      final value = object.integrantes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.proyectos.length * 3;
  {
    for (var i = 0; i < object.proyectos.length; i++) {
      final value = object.proyectos[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.titulo.length * 3;
  return bytesCount;
}

void _tarjetaSerialize(
  Tarjeta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.descripcion);
  writer.writeDateTime(offsets[1], object.fechaLimite);
  writer.writeDateTime(offsets[2], object.fechaRealizacion);
  writer.writeStringList(offsets[3], object.integrantes);
  writer.writeStringList(offsets[4], object.proyectos);
  writer.writeString(offsets[5], object.titulo);
}

Tarjeta _tarjetaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tarjeta(
    descripcion: reader.readString(offsets[0]),
    fechaLimite: reader.readDateTime(offsets[1]),
    fechaRealizacion: reader.readDateTime(offsets[2]),
    integrantes: reader.readStringList(offsets[3]) ?? [],
    isarId: id,
    proyectos: reader.readStringList(offsets[4]) ?? [],
    titulo: reader.readString(offsets[5]),
  );
  return object;
}

P _tarjetaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tarjetaGetId(Tarjeta object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _tarjetaGetLinks(Tarjeta object) {
  return [];
}

void _tarjetaAttach(IsarCollection<dynamic> col, Id id, Tarjeta object) {
  object.isarId = id;
}

extension TarjetaQueryWhereSort on QueryBuilder<Tarjeta, Tarjeta, QWhere> {
  QueryBuilder<Tarjeta, Tarjeta, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TarjetaQueryWhere on QueryBuilder<Tarjeta, Tarjeta, QWhereClause> {
  QueryBuilder<Tarjeta, Tarjeta, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<Tarjeta, Tarjeta, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterWhereClause> isarIdBetween(
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

extension TarjetaQueryFilter
    on QueryBuilder<Tarjeta, Tarjeta, QFilterCondition> {
  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> fechaLimiteEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaLimite',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> fechaLimiteGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaLimite',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> fechaLimiteLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaLimite',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> fechaLimiteBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaLimite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> fechaRealizacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaRealizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      fechaRealizacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaRealizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      fechaRealizacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaRealizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> fechaRealizacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaRealizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'integrantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'integrantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'integrantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'integrantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'integrantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'integrantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'integrantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'integrantes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'integrantes',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'integrantes',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'integrantes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> integrantesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'integrantes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'integrantes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'integrantes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'integrantes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      integrantesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'integrantes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proyectos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proyectos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proyectos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proyectos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'proyectos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'proyectos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'proyectos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'proyectos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proyectos',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'proyectos',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'proyectos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'proyectos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'proyectos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'proyectos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition>
      proyectosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'proyectos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> proyectosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'proyectos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterFilterCondition> tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }
}

extension TarjetaQueryObject
    on QueryBuilder<Tarjeta, Tarjeta, QFilterCondition> {}

extension TarjetaQueryLinks
    on QueryBuilder<Tarjeta, Tarjeta, QFilterCondition> {}

extension TarjetaQuerySortBy on QueryBuilder<Tarjeta, Tarjeta, QSortBy> {
  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByFechaLimite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLimite', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByFechaLimiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLimite', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByFechaRealizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRealizacion', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByFechaRealizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRealizacion', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension TarjetaQuerySortThenBy
    on QueryBuilder<Tarjeta, Tarjeta, QSortThenBy> {
  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByFechaLimite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLimite', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByFechaLimiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLimite', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByFechaRealizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRealizacion', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByFechaRealizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRealizacion', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QAfterSortBy> thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension TarjetaQueryWhereDistinct
    on QueryBuilder<Tarjeta, Tarjeta, QDistinct> {
  QueryBuilder<Tarjeta, Tarjeta, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QDistinct> distinctByFechaLimite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaLimite');
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QDistinct> distinctByFechaRealizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaRealizacion');
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QDistinct> distinctByIntegrantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'integrantes');
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QDistinct> distinctByProyectos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proyectos');
    });
  }

  QueryBuilder<Tarjeta, Tarjeta, QDistinct> distinctByTitulo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }
}

extension TarjetaQueryProperty
    on QueryBuilder<Tarjeta, Tarjeta, QQueryProperty> {
  QueryBuilder<Tarjeta, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Tarjeta, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Tarjeta, DateTime, QQueryOperations> fechaLimiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaLimite');
    });
  }

  QueryBuilder<Tarjeta, DateTime, QQueryOperations> fechaRealizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaRealizacion');
    });
  }

  QueryBuilder<Tarjeta, List<String>, QQueryOperations> integrantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'integrantes');
    });
  }

  QueryBuilder<Tarjeta, List<String>, QQueryOperations> proyectosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proyectos');
    });
  }

  QueryBuilder<Tarjeta, String, QQueryOperations> tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }
}
