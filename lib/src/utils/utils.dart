// Flutter imports:
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadStringFromAssets(String path) async {
  try {
    final result = await rootBundle.loadString(path);
    return result;
  } catch (e) {
    throw Exception('Cannot load data from $path');
  }
}
