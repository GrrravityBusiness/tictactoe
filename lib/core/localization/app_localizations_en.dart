// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nav_go_to_onboarding => 'Go to Onboarding';

  @override
  String get onboarding_step_add_name => 'Start by creating your player name';

  @override
  String get onboarding_action_validate_name => 'That\'s my name !';

  @override
  String get onboarding_welcome_title => 'Welcome on TicTacToe';

  @override
  String get onboarding_field_playername_label => 'Player Name';

  @override
  String get theme_action_toggle => 'Toggle Theme';
}
