import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void showSnackBar(BuildContext context, String content) {
  try {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  } catch (e) {
    if (kDebugMode) {
      print(content);
    }
  }
}