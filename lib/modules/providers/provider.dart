import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/modules/repositories/login_repository.dart';

final loginRespositoryProvider = Provider.autoDispose<ILoginRespository>((ref) {
  return LoginRespository();
});
