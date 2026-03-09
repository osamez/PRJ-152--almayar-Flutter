import 'dart:developer' as developer;

class AppLogger {
  // Private constructor to prevent instantiation
  AppLogger._();

  // ANSI Color Codes for terminal visibility
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _cyan = '\x1B[36m';

  // Toggle this to false in production
  static bool _isEnabled = true;

  static void init({bool isEnabled = true}) {
    _isEnabled = isEnabled;
  }

  /// 🐛 Debug: Detailed info for debugging (e.g., variable values)
  static void debug(String message) {
    _log(message, level: 500, name: 'DEBUG', color: _cyan);
  }

  /// ℹ️ Info: General app flow events (e.g., "App Started")
  static void info(String message) {
    _log(message, level: 800, name: 'INFO', color: _green);
  }

  /// ⚠️ Warning: Unexpected but handled issues
  static void warning(String message, [dynamic error]) {
    _log(message, level: 900, name: 'WARNING', color: _yellow, error: error);
  }

  /// ❌ Error: Critical failures requiring attention
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _log(
      message,
      level: 1000,
      name: 'ERROR',
      color: _red,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// 🌐 Network: Specific logs for API requests/responses
  static void network(String message) {
    _log(message, level: 800, name: 'NETWORK', color: _blue);
  }

  static void _log(
    String message, {
    required int level,
    required String name,
    required String color,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (!_isEnabled) return;

    // Add a simple timestamp: [12:30:45]
    final timestamp = DateTime.now()
        .toIso8601String()
        .split('T')[1]
        .substring(0, 8);

    // Format the message with colors
    final formattedMessage = '$color[$timestamp] $message$_reset';

    developer.log(
      formattedMessage,
      name: name,
      level: level,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
