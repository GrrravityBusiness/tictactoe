import 'package:flutter/material.dart';

class Constants {
  //ENV
  static const bool prettier = bool.fromEnvironment('PRETTIER');

  // Snackbar Key used  to show "contextless" snackbars in the app
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
}
