import 'dart:io';

import 'package:logger/logger.dart' as log;
import 'package:quiz/utils/file_manager.dart';
import 'package:quiz/utils/log/file_output.dart';

/// Use a [Logger] to log debug messages.
///
/// [Logger]s are named using a hierarchical dot-separated name convention.
///
/// https://github.com/SourceHorizon/logger
class Logger {
  static final _logger = log.Logger(
      printer: log.PrettyPrinter(
          methodCount: 2, // Number of method calls to be displayed
          errorMethodCount:
              8, // Number of method calls if stacktrace is provided
          lineLength: 120, // Width of the output
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: true // Should each log print contain a timestamp
          ));

  Logger._internal();
  factory Logger() => _instance;

  /// instance
  static final Logger _instance = Logger._internal();
  static Logger get instance => _instance;

  final bool _consoleOutput = true;
  static log.Logger? _fileLogger;

  /// 私有
  Logger.logfile() {
    final now = DateTime.now();
    String month = '${now.month}';
    String day = '${now.day}';
    month = month.length < 2 ? '0$month' : month;
    day = day.length < 2 ? '0$day' : day;

    String name = '${now.year}-$month-$day.txt';
    FileManager.cacheFilePath(dirPath: 'logs', fileName: name)?.then((value) {
      try {
        final file = File(value);
        final output = QuizFileOutput(file: file);
        _fileLogger = log.Logger(
            printer: log.SimplePrinter(colors: false), output: output);
      } catch (e) {
        print('log file 初始化失败 ${e.toString()}');
      }
    });
  }

  /// Log a message at level [Level.debug].
  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (_consoleOutput) {
      _logger.d(message, error: error, stackTrace: stackTrace);
      _fileLogger?.d(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a message at level [Level.info].
  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (_consoleOutput) {
      _logger.i(message, error: error, stackTrace: stackTrace);
    }
    _fileLogger?.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_consoleOutput) {
      _logger.w(message, error: error, stackTrace: stackTrace);
    }
    _fileLogger?.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_consoleOutput) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
    _fileLogger?.e(message, error: error, stackTrace: stackTrace);
  }
}
