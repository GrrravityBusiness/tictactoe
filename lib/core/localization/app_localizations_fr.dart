// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get nav_go_to_onboarding => 'Aller sur l\'onboarding';

  @override
  String get onboarding_step_add_name => 'Commence par créer ton nom';

  @override
  String get onboarding_action_validate_name => 'C\'est bien moi !';

  @override
  String get onboarding_welcome_title => 'Bienvenue sur TicTacToe';

  @override
  String get onboarding_field_playername_label => 'Nom de joueur';

  @override
  String get theme_action_toggle => 'Changer de thème';

  @override
  String get onboarding_prevent_close_title =>
      'You have to set yourself a name before leaving!';
}
