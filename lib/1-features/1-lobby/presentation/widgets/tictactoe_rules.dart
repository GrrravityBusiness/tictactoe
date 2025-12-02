import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/widgets/painter/tictactoe_painter.dart';

class TicTacToeRulesModal extends StatelessWidget {
  const TicTacToeRulesModal({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dsTokens = context.dsTokens;
    return Dialog(
      insetPadding: EdgeInsets.all(dsTokens.spacing.large),
      child: Padding(
        padding: EdgeInsets.all(context.dsTokens.spacing.large),
        child: CustomScrollView(
          slivers: [
            PinnedHeaderSliver(
              child: Container(
                color: theme.colorScheme.surfaceContainerHigh,
                padding: EdgeInsets.only(
                  bottom: context.dsTokens.spacing.medium,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.rule_title,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: theme.primaryTextTheme.bodyLarge,
                      children: [
                        TextSpan(text: l10n.rule_one),
                        TextSpan(text: l10n.rule_two_1),
                        TextSpan(
                          text: l10n.tictactoe_x,
                          style: theme.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: theme.colorScheme.primary,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        TextSpan(text: l10n.rule_two_2),
                        TextSpan(
                          text: l10n.tictactoe_o,
                          style: theme.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.blue,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        TextSpan(text: l10n.rule_two_3),
                        TextSpan(text: l10n.rule_three),
                        TextSpan(text: l10n.rule_four),
                        TextSpan(text: l10n.rule_five),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.rule_cases_example,
                    style: theme.primaryTextTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  SizedBox(height: dsTokens.spacing.large),
                  // Note: Example with predefined boards to illustrate rules
                  _ExampleBoard(
                    board: const [1, 1, 1, 0, -1, 0, -1, -1, -1],
                    caption: l10n.rule_horizontal_x_win,
                  ),
                  const Divider(),
                  SizedBox(height: dsTokens.spacing.large),
                  _ExampleBoard(
                    board: const [0, 1, 1, 1, 0, 0, 1, -1, 0],
                    caption: l10n.rule_diagonal_0_win,
                  ),
                  const Divider(),
                  SizedBox(height: dsTokens.spacing.large),
                  _ExampleBoard(
                    board: const [0, 1, 0, 0, 1, 1, 0, -1, 1],
                    caption: l10n.rule_vertical_o_win,
                  ),
                  const Divider(),
                  SizedBox(height: dsTokens.spacing.large),
                  _ExampleBoard(
                    board: const [1, 0, 1, 0, 1, 0, 0, 1, 0],
                    caption: l10n.rule_draw,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExampleBoard extends StatelessWidget {
  const _ExampleBoard({
    required this.board,
    required this.caption,
  });

  final List<int> board;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dsTokens = context.dsTokens;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: dsTokens.spacing.medium),
          child: Text(
            caption,
            style: theme.primaryTextTheme.displaySmall!.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.all(
            dsTokens.spacing.large,
          ),
          child: TicTacToePaintWrapper(
            board: board,
            strokeWidth: 4,
          ),
        ),
      ],
    );
  }
}
