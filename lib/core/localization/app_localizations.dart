import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @nav_go_to_onboarding.
  ///
  /// In fr, this message translates to:
  /// **'Changer de nom'**
  String get nav_go_to_onboarding;

  /// No description provided for @onboarding_step_add_name.
  ///
  /// In fr, this message translates to:
  /// **'Commence par créer ton nom'**
  String get onboarding_step_add_name;

  /// No description provided for @onboarding_action_validate_name.
  ///
  /// In fr, this message translates to:
  /// **'C\'est bien moi !'**
  String get onboarding_action_validate_name;

  /// No description provided for @onboarding_welcome_title.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur TicTacToe'**
  String get onboarding_welcome_title;

  /// No description provided for @onboarding_field_playername_label.
  ///
  /// In fr, this message translates to:
  /// **'Nom de joueur'**
  String get onboarding_field_playername_label;

  /// No description provided for @theme_action_toggle.
  ///
  /// In fr, this message translates to:
  /// **'Changer de thème'**
  String get theme_action_toggle;

  /// No description provided for @onboarding_prevent_close_title.
  ///
  /// In fr, this message translates to:
  /// **'Choisis un nom avant de partir !'**
  String get onboarding_prevent_close_title;

  /// No description provided for @lobby_welcome_message.
  ///
  /// In fr, this message translates to:
  /// **'Bonjour {playerName}, prêt à jouer ?'**
  String lobby_welcome_message(String playerName);

  /// No description provided for @lobby_field_opponent_label.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get lobby_field_opponent_label;

  /// No description provided for @lobby_select_opponent_title.
  ///
  /// In fr, this message translates to:
  /// **'Nomme ton adversaire : '**
  String get lobby_select_opponent_title;

  /// No description provided for @lobby_page_error_message.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur s\'est produite'**
  String get lobby_page_error_message;

  /// No description provided for @tictactoe_x.
  ///
  /// In fr, this message translates to:
  /// **'X'**
  String get tictactoe_x;

  /// No description provided for @tictactoe_o.
  ///
  /// In fr, this message translates to:
  /// **'O'**
  String get tictactoe_o;

  /// No description provided for @rule_one.
  ///
  /// In fr, this message translates to:
  /// **'1. Le jeu se joue sur une grille de 3x3.\n\n'**
  String get rule_one;

  /// No description provided for @rule_two_1.
  ///
  /// In fr, this message translates to:
  /// **'2. Deux joueurs jouent à tour de rôle : l\'un est '**
  String get rule_two_1;

  /// No description provided for @rule_two_2.
  ///
  /// In fr, this message translates to:
  /// **', l\'autre est '**
  String get rule_two_2;

  /// No description provided for @rule_two_3.
  ///
  /// In fr, this message translates to:
  /// **'.\n\n'**
  String get rule_two_3;

  /// No description provided for @rule_four.
  ///
  /// In fr, this message translates to:
  /// **'4. Le premier joueur à aligner 3 de ses symboles (verticalement, horizontalement ou en diagonale) gagne.\n\n'**
  String get rule_four;

  /// No description provided for @rule_three.
  ///
  /// In fr, this message translates to:
  /// **'3. Les joueurs marquent les cases vides avec leur symbole.\n\n'**
  String get rule_three;

  /// No description provided for @rule_five.
  ///
  /// In fr, this message translates to:
  /// **'5. Si les 9 cases sont remplies et qu\'aucun joueur n\'a aligné 3 symboles, c\'est une égalité.'**
  String get rule_five;

  /// No description provided for @rule_title.
  ///
  /// In fr, this message translates to:
  /// **'Règles du TicTacToe'**
  String get rule_title;

  /// No description provided for @rule_cases_example.
  ///
  /// In fr, this message translates to:
  /// **'Exemples :'**
  String get rule_cases_example;

  /// No description provided for @rule_horizontal_x_win.
  ///
  /// In fr, this message translates to:
  /// **'X gagne (horizontal)'**
  String get rule_horizontal_x_win;

  /// No description provided for @rule_diagonal_0_win.
  ///
  /// In fr, this message translates to:
  /// **'O gagne (diagonale)'**
  String get rule_diagonal_0_win;

  /// No description provided for @rule_vertical_o_win.
  ///
  /// In fr, this message translates to:
  /// **'O gagne (vertical)'**
  String get rule_vertical_o_win;

  /// No description provided for @rule_draw.
  ///
  /// In fr, this message translates to:
  /// **'Match nul (aucun gagnant)'**
  String get rule_draw;

  /// No description provided for @lobby_see_rules.
  ///
  /// In fr, this message translates to:
  /// **'Voir les règles du jeu'**
  String get lobby_see_rules;

  /// No description provided for @lobby_start_game.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer la partie !'**
  String get lobby_start_game;

  /// No description provided for @lobby_scoreboard_title.
  ///
  /// In fr, this message translates to:
  /// **'Scores'**
  String get lobby_scoreboard_title;

  /// No description provided for @scoreboard_vs_draw.
  ///
  /// In fr, this message translates to:
  /// **'🤝 VS 🤝'**
  String get scoreboard_vs_draw;

  /// No description provided for @scoreboard_vs_winner.
  ///
  /// In fr, this message translates to:
  /// **'🔥 VS 🔥'**
  String get scoreboard_vs_winner;

  /// No description provided for @game_personal_score.
  ///
  /// In fr, this message translates to:
  /// **'Score: {gamerWins}'**
  String game_personal_score(int gamerWins);

  /// No description provided for @game_result_dialog_label.
  ///
  /// In fr, this message translates to:
  /// **'Résultat'**
  String get game_result_dialog_label;

  /// No description provided for @game_result_back_lobby_action.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get game_result_back_lobby_action;

  /// No description provided for @game_result_continue_play_action.
  ///
  /// In fr, this message translates to:
  /// **'Rejouer'**
  String get game_result_continue_play_action;

  /// No description provided for @game_result_draw_text.
  ///
  /// In fr, this message translates to:
  /// **'Match nul !'**
  String get game_result_draw_text;

  /// No description provided for @game_result_winner_text.
  ///
  /// In fr, this message translates to:
  /// **'{winnerName} gagne !'**
  String game_result_winner_text(String winnerName);

  /// No description provided for @game_result_vs_text.
  ///
  /// In fr, this message translates to:
  /// **'🔥 VS 🔥'**
  String get game_result_vs_text;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
