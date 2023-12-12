import 'package:isar/isar.dart';
import 'package:quiz/modules/database/model/filter/filter_tag.dart';
import 'package:quiz/modules/database/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_tag_manager.g.dart';

class FilterTagManager {
  final Isar _isar;

  FilterTagManager(this._isar);

  Future<List<FilterTag>> getFilterTag() async {
    return _isar.filterTags.where().findAll();
  }
}

@riverpod
Future<FilterTagManager> filterTagManager(FutureProviderRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return FilterTagManager(isar);
}
