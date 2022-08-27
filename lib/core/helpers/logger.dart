import 'package:logger/logger.dart';

/* 

* logger.v("Verbose log");

* logger.d("Debug log");

* logger.i("Info log");

* logger.w("Warning log");

* logger.e("Error log");

* logger.wtf("What a terrible failure log");

*/
var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);
