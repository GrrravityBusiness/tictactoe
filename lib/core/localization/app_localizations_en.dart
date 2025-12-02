// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nav_go_to_onboarding => 'Change my name';

  @override
  String get onboarding_step_add_name => 'Start by creating your player name';

  @override
  String get onboarding_action_validate_name => 'That\'s my name !';

  @override
  String get onboarding_welcome_title => 'Tic Tac Toe';

  @override
  String get onboarding_field_playername_label => 'Player Name';

  @override
  String get theme_action_toggle => 'Toggle Theme';

  @override
  String get onboarding_prevent_close_title =>
      'You have to set yourself a name before leaving!';

  @override
  String lobby_welcome_message(String playerName) {
    return 'Hello $playerName, ready to play ?';
  }

  @override
  String get lobby_field_opponent_label => 'Name';

  @override
  String get lobby_select_opponent_title => 'Who are we fighting?';

  @override
  String get lobby_page_error_message => 'An error occurred';

  @override
  String get tictactoe_x => 'X';

  @override
  String get tictactoe_o => 'O';

  @override
  String get rule_one => '1. The game is played on a 3x3 grid.\n\n';

  @override
  String get rule_two_1 => '2. Two players take turns: one is ';

  @override
  String get rule_two_2 => ', the other is ';

  @override
  String get rule_two_3 => '.\n\n';

  @override
  String get rule_four =>
      '4. The first player to get 3 of their marks in a row (vertically, horizontally, or diagonally) wins.\n\n';

  @override
  String get rule_three =>
      '3. Players mark empty squares with their symbol.\n\n';

  @override
  String get rule_five =>
      '5. If all 9 squares are filled and no player has 3 in a row, the game is a draw.';

  @override
  String get rule_title => 'TicTacToe Rules';

  @override
  String get rule_cases_example => 'Examples:';

  @override
  String get rule_horizontal_x_win => 'X wins (horizontal)';

  @override
  String get rule_diagonal_0_win => 'O wins (diagonal)';

  @override
  String get rule_vertical_o_win => 'O wins (vertical)';

  @override
  String get rule_draw => 'Draw (no winner)';

  @override
  String get lobby_see_rules => 'Check game rules';

  @override
  String get lobby_start_game => 'Start !';

  @override
  String get lobby_scoreboard_title => 'Scoreboard';

  @override
  String get scoreboard_vs_draw => '🤝 VS 🤝';

  @override
  String get scoreboard_vs_winner => '🔥 VS 🔥';

  @override
  String game_personal_score(int gamerWins) {
    return 'Score: $gamerWins';
  }

  @override
  String get game_result_dialog_label => 'Game Result';

  @override
  String get game_result_back_lobby_action => 'Back to Lobby';

  @override
  String get game_result_continue_play_action => 'Play Again';

  @override
  String get game_result_draw_text => 'It\'s a Draw!';

  @override
  String game_result_winner_text(String winnerName) {
    return '$winnerName Wins !';
  }

  @override
  String get game_result_vs_text => '🔥 VS 🔥';

  @override
  String get scoreboard_empty_title => 'Scoreboard is empty for now.';
}
