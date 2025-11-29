import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/constants.dart';

/// Provides utility classes for displaying customized SnackBars
///  including error, success, warning, and simple messages.
///
/// The toast bar can be used throughout the application to provide
/// feedback, alerts, or status updates in a visually distinct manner.
///
/// This utility is designed to be reusable and customizable to fit
/// various notification scenarios.
/// Usage:
/// - Use [ShowSnackBar.showError], [ShowSnackBar.showSuccess],
///  [ShowSnackBar.showWarning] or [ShowSnackBar.showSimple] to display
///  a SnackBar with a specific predefined styles.
/// - Each method allows customization of title, message, duration,
///  action, background color, and margin.
///
/// Example:
/// ```dart
/// ShowSnackBar.showError(title: 'Error', message: 'Something went wrong');
/// ShowSnackBar.showSuccess(title: 'Success', message: 'Operation completed');
/// ```
class ShowSnackBar {
  /// Displays an error message using a [Toaster] which handle the display of
  /// a SnackBar and dismissing previously existing snackbar.
  ///
  /// Example usage:
  /// ```dart
  /// ShowSnackBar.showError(message: 'An error occurred');
  /// ```
  ///
  /// Parameters must include the error [title].
  /// Optional parameters allow customization of an extra message, duration,
  /// action [SnackBarAction], background color, and margin.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    return Toaster.showSnackBar(
      snackBar: Toaster.error(
        title: title,
        message: message,
        action: action,
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Displays an success message using a [Toaster] which handle the display of
  /// a SnackBar and dismissing previously existing snackbar.
  ///
  /// Example usage:
  /// ```dart
  /// ShowSnackBar.showSuccess(message: 'All good');
  /// ```
  ///
  /// Parameters must include the error [title].
  /// Optional parameters allow customization of an extra message, duration,
  /// action [SnackBarAction], background color, and margin.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    return Toaster.showSnackBar(
      snackBar: Toaster.success(
        title: title,
        message: message,
        action: action,
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Displays an basic message using a [Toaster] which handle the display of
  /// a SnackBar and dismissing previously existing snackbar.
  ///
  /// Example usage:
  /// ```dart
  /// ShowSnackBar.showSimple(message: 'Hello world');
  /// ```
  ///
  /// Parameters must include the error [title].
  /// Optional parameters allow customization of an extra message, duration,
  /// action [SnackBarAction], background color, and margin.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSimple({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    return Toaster.showSnackBar(
      snackBar: Toaster.simple(
        title: title,
        message: message,
        action: action,
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Displays an warning message using a [Toaster] which handle the display of
  /// a SnackBar and dismissing previously existing snackbar.
  ///
  /// Example usage:
  /// ```dart
  /// ShowSnackBar.showWarning(message: 'Oops !');
  /// ```
  ///
  /// Parameters must include the error [title].
  /// Optional parameters allow customization of an extra message, duration,
  /// action [SnackBarAction], background color, and margin.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showWarning({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    return Toaster.showSnackBar(
      snackBar: Toaster.warning(
        title: title,
        message: message,
        action: action,
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

/// The [Toaster] class provides factory constructors for each style,
/// building a SnackBar with appropriate colors, icons, and layout.
/// the [Toaster.showSnackBar] method handles displaying the SnackBar
/// using a global [Constants.snackbarKey].
///
/// Example:
/// ```dart
/// Toaster.showSnackBar(
///   snackBar: Toast.simple(
///     message: 'your message',
///   ),
/// );
/// ```
class Toaster extends SnackBar {
  /// Facotory constructor for a simple toast message.
  /// ```dart
  /// Toaster.simple(
  ///   title: 'Info',
  ///   message: 'This is a simple message',
  /// );
  /// ```
  /// Parameters:
  /// - [title]: The main title of the toast.
  /// - [message]: An optional message providing more details.
  /// - [duration]: Duration for which the toast is displayed.
  /// - [action]: An optional SnackBarAction for user interaction.
  /// - [backgroundColor]: Custom background color for the toast.
  /// - [useDefaultMargin]: Whether to use default margin or custom margin.
  factory Toaster.simple({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    final theme = Theme.of(Constants.snackbarKey.currentContext!);
    return Toaster._(
      backgroundColor: backgroundColor ?? theme.colorScheme.onSurface,
      content: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.primaryTextTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
              maxLines: message != null ? 1 : 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (message != null) const SizedBox(height: 4),
            if (message != null)
              Text(
                message,
                style: theme.primaryTextTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: action,
      behavior: SnackBarBehavior.floating,
      margin: useDefaultMargin ?? false
          ? null
          : const EdgeInsets.fromLTRB(15, 5, 15, 10),
    );
  }

  /// Facotory constructor for a error toast message.
  /// ```dart
  /// Toaster.error(
  ///   title: 'Oops !',
  ///   message: 'This is a error message',
  /// );
  /// ```
  /// Parameters:
  /// - [title]: The main title of the toast.
  /// - [message]: An optional message providing more details.
  /// - [duration]: Duration for which the toast is displayed.
  /// - [action]: An optional SnackBarAction for user interaction.
  /// - [backgroundColor]: Custom background color for the toast.
  /// - [useDefaultMargin]: Whether to use default margin or custom margin.
  factory Toaster.error({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    final theme = Theme.of(Constants.snackbarKey.currentContext!);
    return Toaster._(
      backgroundColor: backgroundColor ?? theme.colorScheme.onErrorContainer,
      content: IntrinsicHeight(
        //height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.error,
                size: 26,
                color: theme.colorScheme.errorContainer,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.primaryTextTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                    maxLines: message != null ? 1 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (message != null) const SizedBox(height: 4),
                  if (message != null)
                    Text(
                      message,
                      style: theme.primaryTextTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: action,
      behavior: SnackBarBehavior.floating,
      margin: useDefaultMargin ?? false
          ? null
          : const EdgeInsets.fromLTRB(15, 5, 15, 10),
    );
  }

  /// Facotory constructor for a warning toast message.
  /// ```dart
  /// Toaster.warning(
  ///   title: 'Warning',
  ///   message: 'This is a warning message',
  /// );
  /// ```
  /// Parameters:
  /// - [title]: The main title of the toast.
  /// - [message]: An optional message providing more details.
  /// - [duration]: Duration for which the toast is displayed.
  /// - [action]: An optional SnackBarAction for user interaction.
  /// - [backgroundColor]: Custom background color for the toast.
  /// - [useDefaultMargin]: Whether to use default margin or custom margin.
  factory Toaster.warning({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    final theme = Theme.of(Constants.snackbarKey.currentContext!);
    return Toaster._(
      backgroundColor: backgroundColor ?? theme.colorScheme.tertiary,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: IntrinsicHeight(
          //height: 55,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.warning_amber,
                  size: 26,
                  color: theme.colorScheme.onTertiary,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.primaryTextTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                      maxLines: message != null ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (message != null) const SizedBox(height: 4),
                    if (message != null)
                      Text(
                        message,
                        style: theme.primaryTextTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: action,
      behavior: SnackBarBehavior.floating,
      margin: useDefaultMargin ?? false
          ? null
          : const EdgeInsets.fromLTRB(15, 5, 15, 10),
    );
  }

  /// Facotory constructor for a success toast message.
  /// ```dart
  /// Toaster.success(
  ///   title: 'Perfect !',
  ///   message: 'This is a success message',
  /// );
  /// ```
  /// Parameters:
  /// - [title]: The main title of the toast.
  /// - [message]: An optional message providing more details.
  /// - [duration]: Duration for which the toast is displayed.
  /// - [action]: An optional SnackBarAction for user interaction.
  /// - [backgroundColor]: Custom background color for the toast.
  /// - [useDefaultMargin]: Whether to use default margin or custom margin.
  factory Toaster.success({
    required String title,
    String? message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    bool? useDefaultMargin,
  }) {
    final theme = Theme.of(Constants.snackbarKey.currentContext!);
    return Toaster._(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.check,
                  size: 26,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.primaryTextTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                      maxLines: message != null ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (message != null) const SizedBox(height: 4),
                    if (message != null)
                      Text(
                        message,
                        style: theme.primaryTextTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: action,
      behavior: SnackBarBehavior.floating,
      margin: useDefaultMargin ?? false
          ? null
          : const EdgeInsets.fromLTRB(15, 5, 15, 10),
    );
  }

  const Toaster._({
    required super.content,
    required super.duration,
    required Color super.backgroundColor,
    super.action,
    super.behavior,
    super.margin,
  });

  /// Utility method to show a SnackBar using the global
  /// [Constants.snackbarKey].
  ///
  /// It first clears any existing SnackBars before displaying the new one.
  ///
  /// ```dart
  /// Toaster.showSnackBar(
  ///   snackBar: Toaster.success(
  ///     message: 'your message',
  ///   ),
  /// );
  /// ```
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  showSnackBar({
    required SnackBar snackBar,
  }) {
    Constants.snackbarKey.currentState?.clearSnackBars();
    return Constants.snackbarKey.currentState!.showSnackBar(snackBar);
  }
}
