import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/modules/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginRespositoryProvider = Provider.autoDispose<ILoginRespository>((ref) {
  return LoginRespository();
});

late final SharedPreferences sharedPreferences;
late final Provider<SharedPreferences> sharedProvider;
Future<void> initSharedPreference() async {
  SharedPreferences sharedInstance = await SharedPreferences.getInstance();
  sharedProvider = Provider<SharedPreferences>((ref) => sharedInstance);
  sharedPreferences = sharedInstance;
}
