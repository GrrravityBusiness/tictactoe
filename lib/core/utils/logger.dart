import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tictactoe/core/utils/constants.dart';

enum LogColor {
  red('\x1B[31m', '⛔'),
  green('\x1B[32m', '✅'),
  yellow('\x1B[33m', '💡'),
  bleu('\x1B[34m', '🖊️'),
  purple('\x1B[35m', '⚙️'),
  cyan('\x1B[36m', '🛜'),
  pink('\x1B[95m', '🕵🏻‍♂️'),
  reset('\x1B[0m'),
  getColor('\x1B[46m\x1B[1m\x1B[97m'),
  postColor('\x1B[42m\x1B[1m\x1B[97m'),
  putColor('\x1B[43m\x1B[1m\x1B[97m'),
  deleteColor('\x1B[41m\x1B[1m\x1B[97m')
  ;

  const LogColor(this.ansiCode, [this.iconFallback = '']);
  final String ansiCode;
  final String iconFallback;
}

/// Utility class to log messages with different severity levels (colors)
/// to the console. Only logs in debug mode.
///
/// You can use shortcuts functions like [Logger.e] if you prefere using Default
/// logger instance.
///
/// when using in CI/CD environment, logs are disabled to avoid cluttering
/// the output.
class Logger {
  Logger([this.name]);

  final String? name;

  //avoid printing in CICD
  final bool _isNotTestDrivers = !Platform.environment.containsKey(
    'FLUTTER_TEST',
  );

  final colorRegexp = RegExp(
    LogColor.values
        .map((e) => '\\${e.ansiCode.replaceAll('[', r'\[')}')
        .toList()
        .join('|'),
  );

  static final Logger _defaultInstance = Logger('Default');

  /// Print a error message in red using Default logger
  static void e(Object message, {Object? error, StackTrace? stackTrace}) =>
      _defaultInstance.error(
        message.toString(),
        error: error,
        stackTrace: stackTrace,
      );

  /// Print a error message in red
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _print(message, LogColor.red, error: error, stackTrace: stackTrace);
  }

  /// Print a success message in green using Default logger
  static void s(Object message) => _defaultInstance.success(message.toString());

  /// Print a success message in green
  void success(String message) {
    _print(message, LogColor.green);
  }

  /// Print a info message in yellow using Default logger
  static void i(Object message) => _defaultInstance.info(message.toString());

  /// Print a success message in yellow
  void info(String message) {
    _print(message, LogColor.yellow);
  }

  /// Print a process message in purple using Default logger
  static void p(Object message) => _defaultInstance.process(message.toString());

  /// Print a success message in purple
  void process(String message) {
    _print(message, LogColor.purple);
  }

  /// Print a request message in cyan using Default logger
  static void r(Object message) => _defaultInstance.request(message.toString());

  /// Print a success message in cyan
  void request(String message) {
    _print(message, LogColor.cyan);
  }

  /// Print a other message in blue using Default logger
  static void o(Object message) => _defaultInstance.other(message.toString());

  /// Print a success message in blue
  void other(String message) {
    _print(message, LogColor.bleu);
  }

  /// Print a info message in yellow using Default logger
  static void t(Object message) => _defaultInstance.track(message.toString());

  /// Print a success message in yellow
  void track(String message) {
    _print(message, LogColor.pink);
  }

  void _print(
    String message,
    LogColor color, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode && _isNotTestDrivers) {
      final loggerName = _getLoggerName(name, stackTrace);

      if (Constants.prettier) {
        log(
          color.ansiCode + message + LogColor.reset.ansiCode,
          name: loggerName,
          error: error == null
              ? null
              : color.ansiCode + error.toString() + LogColor.reset.ansiCode,
          stackTrace: stackTrace,
        );
      } else {
        // for boring IDE's or devices that don't like good fancy logs -_-
        final logs = _getLogStrings(
          message: '[$loggerName]  $message',
          error: error,
          stackTrace: stackTrace,
        );
        for (final e in logs) {
          if (e != null) {
            debugPrint(_applyColorIfCompatible(string: e, color: color));
          }
        }
      }
    }
  }

  String _getLoggerName(String? name, StackTrace? stackTrace) {
    if (name == 'Default' && stackTrace != null) {
      return stackTrace
          .toString()
          .split('.')
          .first
          .replaceAll(' ', '')
          .replaceAll('#0', '');
    }
    return name ?? 'Default';
  }

  List<String?> _getLogStrings({
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final messages = [message, error?.toString(), stackTrace?.toString()]
      ..removeWhere((e) => e == null);

    final pattern = RegExp('.{1,700}');
    final logs = messages.map(
      (e) => pattern.allMatches(e!).map((e) => e.group(0)),
    );
    return logs
        .fold(
          <String?>[],
          (previousValue, element) => previousValue..addAll(element),
        )
        .toList();
  }

  String _applyColorIfCompatible({
    required String string,
    required LogColor color,
  }) {
    return Platform.isAndroid
        ? color.ansiCode + string + LogColor.reset.ansiCode
        : color.iconFallback + _removeColors(string);
  }

  String _removeColors(String string) {
    return string.replaceAllMapped(colorRegexp, (match) => '');
  }
}
