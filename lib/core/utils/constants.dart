import 'package:flutter/material.dart';

class Constants {
  //ENV
  static const bool prettier = bool.fromEnvironment('PRETTIER');
  static const String storagePath = String.fromEnvironment('STORAGE_PATH');

  // Snackbar Key used  to show "contextless" snackbars in the app
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
}
