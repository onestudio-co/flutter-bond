import 'dart:io';

/// Print messages in the console
/// e.g. MetroConsole.writeInGreen('success');
class MetroConsole {
  /// writes a [message] in green.
  static writeInGreen(String message) {
    stdout.writeln('\x1B[92m' + message + '\x1B[0m');
  }

  /// writes a [message] in red.
  static writeInRed(String message) {
    stdout.writeln('\x1B[91m' + message + '\x1B[0m');
  }

  /// writes a [message] in black.
  static writeInBlack(String message) {
    stdout.writeln(message);
  }
}
