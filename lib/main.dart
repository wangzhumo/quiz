import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/store/shared_preference.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/utils/log/logger.dart';

void main() {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  runApp(const ProviderScope(child: QuizApp()));
}

class QuizApp extends ConsumerStatefulWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends ConsumerState<QuizApp> {
  @override
  Widget build(BuildContext context) {
    Logger.instance.debug("_QuizAppState initState");
    var defaultTheme = Theme.of(context).copyWith(
      platform: TargetPlatform.iOS,
      highlightColor: Colors.blue,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    );
    UserManager um = ref.read(userProvider.notifier);
    return FutureBuilder(
        future: bootstrap(um),
        builder: (BuildContext build, AsyncSnapshot<void> snapshot) {
          return MaterialApp.router(
            routerConfig: routers,
            theme: defaultTheme,
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              L.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: L.delegate.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale?.languageCode == 'en') {
                return const Locale('en', "US");
              }
              return locale;
            },
          );
        });
  }

  Future<void> bootstrap(UserManager um) async {
    // init user.
    User? user = await SharedPreference().getUser();
    if (user != null) {
      um.restore(user);
    }
    // show app
    FlutterNativeSplash.remove();
  }
}
