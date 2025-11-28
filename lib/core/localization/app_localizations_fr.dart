// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get nav_go_to_onboarding => 'Changer de nom';

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

  @override
  String get tictactoe_x => 'X';

  @override
  String get tictactoe_o => 'O';

  @override
  String get rule_one => '1. Le jeu se joue sur une grille de 3x3.\n\n';

  @override
  String get rule_two_1 => '2. Deux joueurs jouent à tour de rôle : l\'un est ';

  @override
  String get rule_two_2 => ', l\'autre est ';

  @override
  String get rule_two_3 => '.\n\n';

  @override
  String get rule_four =>
      '4. Le premier joueur à aligner 3 de ses symboles (verticalement, horizontalement ou en diagonale) gagne.\n\n';

  @override
  String get rule_three =>
      '3. Les joueurs marquent les cases vides avec leur symbole.\n\n';

  @override
  String get rule_five =>
      '5. Si les 9 cases sont remplies et qu\'aucun joueur n\'a aligné 3 symboles, c\'est une égalité.';

  @override
  String get rule_title => 'Règles du TicTacToe';

  @override
  String get rule_cases_example => 'Exemples :';

  @override
  String get rule_horizontal_x_win => 'X gagne (horizontal)';

  @override
  String get rule_diagonal_0_win => 'O gagne (diagonale)';

  @override
  String get rule_vertical_o_win => 'O gagne (vertical)';

  @override
  String get rule_draw => 'Match nul (aucun gagnant)';

  @override
  String get lobby_see_rules => 'Voir les règles du jeu';

  @override
  String get lobby_start_game => 'Démarrer la partie !';

  @override
  String get lobby_scoreboard_title => 'Scores';

  @override
  String get scoreboard_vs_draw => '🤝 VS 🤝';

  @override
  String get scoreboard_vs_winner => '🔥 VS 🔥';

  @override
  String game_personal_score(int gamerWins) {
    return 'Score: $gamerWins';
  }

  @override
  String get game_result_dialog_label => 'Résultat';

  @override
  String get game_result_back_lobby_action => 'Accueil';

  @override
  String get game_result_continue_play_action => 'Rejouer';

  @override
  String get game_result_draw_text => 'Match nul !';

  @override
  String game_result_winner_text(String winnerName) {
    return '$winnerName gagne !';
  }

  @override
  String get game_result_vs_text => '🔥 VS 🔥';
}
