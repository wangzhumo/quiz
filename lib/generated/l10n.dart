// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L {
  L();

  static L? _current;

  static L get current {
    assert(_current != null,
        'No instance of L was loaded. Try to initialize the L delegate before accessing L.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L();
      L._current = instance;

      return instance;
    });
  }

  static L of(BuildContext context) {
    final instance = L.maybeOf(context);
    assert(instance != null,
        'No instance of L present in the widget tree. Did you add L.delegate in localizationsDelegates?');
    return instance!;
  }

  static L? maybeOf(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  /// `Quizzes`
  String get appName {
    return Intl.message(
      'Quizzes',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sumbit`
  String get globalSumbit {
    return Intl.message(
      'Sumbit',
      name: 'globalSumbit',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get globalSignIn {
    return Intl.message(
      'Sign In',
      name: 'globalSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sing Up`
  String get globalSingUp {
    return Intl.message(
      'Sing Up',
      name: 'globalSingUp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get globalConfirm {
    return Intl.message(
      'Confirm',
      name: 'globalConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Hint`
  String get globalHint {
    return Intl.message(
      'Hint',
      name: 'globalHint',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get globalCancel {
    return Intl.message(
      'Cancel',
      name: 'globalCancel',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get tab_discover {
    return Intl.message(
      'Discover',
      name: 'tab_discover',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get tab_profile {
    return Intl.message(
      'Profile',
      name: 'tab_profile',
      desc: '',
      args: [],
    );
  }

  /// `Quizzes`
  String get tab_quizzes {
    return Intl.message(
      'Quizzes',
      name: 'tab_quizzes',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Quizzes`
  String get login_welcome {
    return Intl.message(
      'Welcome to Quizzes',
      name: 'login_welcome',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get login_email {
    return Intl.message(
      'E-Mail',
      name: 'login_email',
      desc: '',
      args: [],
    );
  }

  /// `Type your email here`
  String get login_email_input {
    return Intl.message(
      'Type your email here',
      name: 'login_email_input',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password {
    return Intl.message(
      'Password',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get login_password_input {
    return Intl.message(
      'Enter password',
      name: 'login_password_input',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get login_forget_psd {
    return Intl.message(
      'Forget Password ?',
      name: 'login_forget_psd',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get login_send_code {
    return Intl.message(
      'Send Code',
      name: 'login_send_code',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get login_verify_code {
    return Intl.message(
      'Verification Code',
      name: 'login_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code here`
  String get login_code_input {
    return Intl.message(
      'Enter the code here',
      name: 'login_code_input',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get login_new_psd {
    return Intl.message(
      'New Password',
      name: 'login_new_psd',
      desc: '',
      args: [],
    );
  }

  /// `Enter password again`
  String get login_psd_again {
    return Intl.message(
      'Enter password again',
      name: 'login_psd_again',
      desc: '',
      args: [],
    );
  }

  /// `Rest Password`
  String get login_rest_psd {
    return Intl.message(
      'Rest Password',
      name: 'login_rest_psd',
      desc: '',
      args: [],
    );
  }

  /// `Register With Email`
  String get register_email {
    return Intl.message(
      'Register With Email',
      name: 'register_email',
      desc: '',
      args: [],
    );
  }

  /// `NickName`
  String get register_nick {
    return Intl.message(
      'NickName',
      name: 'register_nick',
      desc: '',
      args: [],
    );
  }

  /// `Type your Nick Name`
  String get register_nick_input {
    return Intl.message(
      'Type your Nick Name',
      name: 'register_nick_input',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get profile_logout {
    return Intl.message(
      'Log Out',
      name: 'profile_logout',
      desc: '',
      args: [],
    );
  }

  /// `Confirm to logout your account ?`
  String get profile_logout_content {
    return Intl.message(
      'Confirm to logout your account ?',
      name: 'profile_logout_content',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L> load(Locale locale) => L.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
