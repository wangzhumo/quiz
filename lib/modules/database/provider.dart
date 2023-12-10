import 'package:isar/isar.dart';
import 'package:quiz/modules/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(FutureProviderRef ref) {
  return IsarService().db;
}