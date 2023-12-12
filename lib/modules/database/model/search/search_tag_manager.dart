import 'package:isar/isar.dart';
import 'package:quiz/modules/database/model/search/quiz_search.dart';
import 'package:quiz/modules/database/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_tag_manager.g.dart';

class SearchTagManager {
  final Isar _isar;

  SearchTagManager(this._isar);

  Future<List<SearchTag>> getSearchHistory({int limit = 20}) async {
    return _isar.searchTags
        .where()
        .sortByTimestampDesc()
        .limit(limit)
        .findAll();
  }

  Future<SearchTag> addHistory(String keyword) async {
    final searchTag = SearchTag()
      ..keyword = keyword
      ..timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _isar.writeTxn(() async {
      _isar.searchTags.put(searchTag);
    });
    return searchTag;
  }

  Future<void> removeHistory(Id id) async {
    _isar.writeTxn(() async {
      _isar.searchTags.delete(id);
    });
  }
}

@riverpod
Future<SearchTagManager> searchTagManager(FutureProviderRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return SearchTagManager(isar);
}
