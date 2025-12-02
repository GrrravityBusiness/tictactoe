import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/utils/game_utils.dart';
import 'package:tictactoe/core/widgets/painter/x_o_painters.dart';

class PlayerHUD extends StatelessWidget {
  const PlayerHUD({
    required this.isMain,
    super.key,
  });

  final bool isMain;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return RotatedBox(
      quarterTurns: isMain ? 0 : 2,
      child: BlocBuilder<GameController, GameState>(
        builder: (context, state) {
          final isActivePlayer =
              (state.currentPlayer == 1 && isMain) ||
              (!isMain && state.currentPlayer == 2);
          final gamer = isMain ? state.player1 : state.player2;
          return DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: isActivePlayer
                  ? [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.25,
                        ),
                        blurRadius: 16,
                        spreadRadius: 4,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Wrap(
                  crossAxisAlignment: .end,
                  alignment: .center,
                  spacing: context.dsTokens.spacing.xlarge,
                  children: [
                    Text(
                      gamer.name,
                      style: theme.textTheme.headlineLarge,
                      textAlign: .center,
                    ),
                    Text(
                      l10n.game_personal_score(gamer.wins),
                    ),
                  ],
                ),
                SizedBox(height: context.dsTokens.spacing.xlarge),
                _RemainingCountsRow(isMainGamer: isMain),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RemainingCountsRow extends StatefulWidget {
  const _RemainingCountsRow({
    required this.isMainGamer,
  });

  final bool isMainGamer;

  @override
  State<_RemainingCountsRow> createState() => _RemainingCountsRowState();
}

class _RemainingCountsRowState extends State<_RemainingCountsRow> {
  final List<XorO> _counts = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    final player = widget.isMainGamer
        ? context.read<GameController>().state.player1
        : context.read<GameController>().state.player2;
    final count = player.remainingCounts;
    final symbol = player.symbol;
    _counts.addAll(List.filled(count, symbol));
    super.initState();
  }

  // Note : Remove one count from the remaining counts list with animation
  void _removeCount() {
    final removedItem = _counts.last;
    final index = _counts.length - 1;

    if (_counts.isNotEmpty) {
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(removedItem, index, animation),
      );
    }
    _counts.removeLast();
  }

  // Note : Reset the remaining counts list with animation
  void _reset(int count, XorO symbol) {
    for (var i = _counts.length - 1; i >= 0; i--) {
      _listKey.currentState?.removeItem(
        i,
        (context, animation) => _buildItem(_counts[i], i, animation),
        duration: Duration.zero,
      );
    }
    _counts
      ..clear()
      ..addAll(List.filled(count, symbol));
    _listKey.currentState?.insertAllItems(
      0,
      count,
    );
  }

  // Build method as we are using it in an animated list and Key's context
  // will be manipulated by the stateful widget.
  Widget _buildItem(XorO item, int index, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: SizedBox(
          width: 60,
          child: CustomPaint(
            painter: item == XorO.x
                ? XPainter(
                    color: Theme.of(context).colorScheme.primary,
                    strokeWidth: 4,
                  )
                : OPainter(color: Colors.blue, strokeWidth: 5),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Note : Listen to remaining counts changes to update the list.
        // As the controller does not add any counts, we listen to any changes
        // and use removeCount to update the list accordingly.
        BlocListener<GameController, GameState>(
          listener: (context, state) => _removeCount(),
          listenWhen: (previous, current) {
            final gamer = widget.isMainGamer
                ? current.player1
                : current.player2;
            final previousGamer = widget.isMainGamer
                ? previous.player1
                : previous.player2;
            return gamer.remainingCounts != previousGamer.remainingCounts;
          },
        ),
        // Note: Listen to changes in symbol as it's triggered when
        // restarting a new game. We reset the list accordingly to give
        // players their counts and their new symbol.
        BlocListener<GameController, GameState>(
          listener: (context, state) => _reset(
            widget.isMainGamer
                ? state.player1.remainingCounts
                : state.player2.remainingCounts,
            widget.isMainGamer ? state.player1.symbol : state.player2.symbol,
          ),
          listenWhen: (previous, current) {
            final gamer = widget.isMainGamer
                ? current.player1
                : current.player2;
            final previousGamer = widget.isMainGamer
                ? previous.player1
                : previous.player2;
            return gamer.symbol != previousGamer.symbol;
          },
        ),
      ],
      child: SizedBox(
        height: 60,
        width: double.maxFinite,
        child: Center(
          child: AnimatedList(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            initialItemCount: _counts.length,
            key: _listKey,
            itemBuilder: (context, index, animation) {
              final symbol = _counts[index];
              return _buildItem(symbol, index, animation);
            },
          ),
        ),
      ),
    );
  }
}
