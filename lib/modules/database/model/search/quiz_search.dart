import 'package:isar/isar.dart';

part 'quiz_search.g.dart';

@collection
class SearchTag {
  Id id = Isar.autoIncrement;
  String keyword = '';
  int timestamp = 0;
}
