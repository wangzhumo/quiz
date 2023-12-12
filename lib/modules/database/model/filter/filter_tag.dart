import 'package:isar/isar.dart';

part 'filter_tag.g.dart';

@collection
class FilterTag {
  Id id = Isar.autoIncrement;
  String tagName = '';
  int tagId = 0;
  @Ignore()
  bool checked = false;
}
