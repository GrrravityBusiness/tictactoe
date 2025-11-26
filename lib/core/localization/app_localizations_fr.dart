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
      'Choisis un nom avant de partir !';

  @override
  String lobby_welcome_message(String playerName) {
    return 'Bonjour $playerName, prêt à jouer ?';
  }

  @override
  String get lobby_field_opponent_label => 'Nom';

  @override
  String get lobby_select_opponent_title => 'Nomme ton adversaire : ';

  @override
  String get lobby_page_error_message => 'Une erreur s\'est produite';
}
