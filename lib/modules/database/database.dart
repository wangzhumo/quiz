import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz/modules/database/model/filter/filter_tag.dart';
import 'package:quiz/modules/database/model/search/quiz_search.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([SearchTagSchema, FilterTagSchema],
          directory: dir.path, inspector: true);
      return isar;
    }

    return Future.value(Isar.getInstance());
  }
}
