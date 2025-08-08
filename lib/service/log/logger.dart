import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

abstract class AppLogger {
  static final Logger logger = Logger(
    level: kDebugMode ? Level.all : Level.info,
    printer: PrettyPrinter(methodCount: 2, stackTraceBeginIndex: 1),
  );

  static void d(String msg) {
    logger.d(msg);
  }

  static void i(String msg) {
    logger.i(msg);
  }

  static void e(String msg) {
   logger.e(msg);
  }

  static void debug(String msg, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    logger.d(msg, time: time, error: error, stackTrace: stackTrace);
  }

  static void info(String msg, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    logger.i(msg, time: time, error: error, stackTrace: stackTrace);
  }

  static void error(String msg, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    logger.e(msg, time: time, error: error, stackTrace: stackTrace);
  }

  // todo 如果做埋点，在这里添加
  static void report() {}
}
