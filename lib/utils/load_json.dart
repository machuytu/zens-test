import 'dart:convert';
import 'package:flutter/services.dart';

class LoadJson {
  /// Load a JSON file from the assets folder.
  Future<dynamic> call(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await jsonDecode(response);
    return data;
  }
}
