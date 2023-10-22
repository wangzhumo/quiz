import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/providers/provider.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/utils/log/logger.dart';

void main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await initSharedPreference();
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
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    Logger.instance.debug("_QuizAppState initState");
    return MaterialApp.router(
      routerConfig: routers,
      theme: ref.watch(theme),
      darkTheme: ref.watch(darkTheme),
      themeMode: ref.watch(themeMode),
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
  }
}
