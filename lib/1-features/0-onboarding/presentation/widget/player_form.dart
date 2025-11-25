import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';

class PlayerForm extends StatelessWidget {
  const PlayerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerController, PlayerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 220,
              height: 70,
              padding: EdgeInsets.all(context.dsTokens.spacing.medium),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Player Name'),
                initialValue: state.player?.name ?? '',
                onFieldSubmitted: (value) =>
                    context.read<PlayerController>().setPlayer(name: value),
              ),
            ),
            IconButton(
              onPressed: context.read<PlayerController>().deletePlayer,
              icon: const Icon(Icons.delete),
            ),
          ],
        );
      },
    );
  }
}
