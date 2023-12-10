// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_search.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSearchTagCollection on Isar {
  IsarCollection<SearchTag> get searchTags => this.collection();
}

const SearchTagSchema = CollectionSchema(
  name: r'SearchTag',
  id: -513914688154347076,
  properties: {
    r'keyword': PropertySchema(
      id: 0,
      name: r'keyword',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 1,
      name: r'timestamp',
      type: IsarType.long,
    )
  },
  estimateSize: _searchTagEstimateSize,
  serialize: _searchTagSerialize,
  deserialize: _searchTagDeserialize,
  deserializeProp: _searchTagDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _searchTagGetId,
  getLinks: _searchTagGetLinks,
  attach: _searchTagAttach,
  version: '3.1.0+1',
);

int _searchTagEstimateSize(
  SearchTag object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.keyword.length * 3;
  return bytesCount;
}

void _searchTagSerialize(
  SearchTag object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.keyword);
  writer.writeLong(offsets[1], object.timestamp);
}

SearchTag _searchTagDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchTag();
  object.id = id;
  object.keyword = reader.readString(offsets[0]);
  object.timestamp = reader.readLong(offsets[1]);
  return object;
}

P _searchTagDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _searchTagGetId(SearchTag object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _searchTagGetLinks(SearchTag object) {
  return [];
}

void _searchTagAttach(IsarCollection<dynamic> col, Id id, SearchTag object) {
  object.id = id;
}

extension SearchTagQueryWhereSort
    on QueryBuilder<SearchTag, SearchTag, QWhere> {
  QueryBuilder<SearchTag, SearchTag, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SearchTagQueryWhere
    on QueryBuilder<SearchTag, SearchTag, QWhereClause> {
  QueryBuilder<SearchTag, SearchTag, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SearchTag, SearchTag, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterWhereClause> idBetween(
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

extension SearchTagQueryFilter
    on QueryBuilder<SearchTag, SearchTag, QFilterCondition> {
  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keyword',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keyword',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> keywordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition>
      keywordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> timestampEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition>
      timestampGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> timestampLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterFilterCondition> timestampBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SearchTagQueryObject
    on QueryBuilder<SearchTag, SearchTag, QFilterCondition> {}

extension SearchTagQueryLinks
    on QueryBuilder<SearchTag, SearchTag, QFilterCondition> {}

extension SearchTagQuerySortBy on QueryBuilder<SearchTag, SearchTag, QSortBy> {
  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> sortByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> sortByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension SearchTagQuerySortThenBy
    on QueryBuilder<SearchTag, SearchTag, QSortThenBy> {
  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> thenByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> thenByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension SearchTagQueryWhereDistinct
    on QueryBuilder<SearchTag, SearchTag, QDistinct> {
  QueryBuilder<SearchTag, SearchTag, QDistinct> distinctByKeyword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keyword', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchTag, SearchTag, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension SearchTagQueryProperty
    on QueryBuilder<SearchTag, SearchTag, QQueryProperty> {
  QueryBuilder<SearchTag, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SearchTag, String, QQueryOperations> keywordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keyword');
    });
  }

  QueryBuilder<SearchTag, int, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
