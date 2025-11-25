import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';

class PlayerForm extends StatelessWidget {
  const PlayerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .end,
      children: [
        const PlayerTextField(),
        IconButton(
          onPressed: context.read<PlayerController>().deletePlayer,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}

class PlayerTextField extends StatefulWidget {
  const PlayerTextField({super.key});

  @override
  State<PlayerTextField> createState() => _PlayerTextFieldState();
}

class _PlayerTextFieldState extends State<PlayerTextField> {
  final TextEditingController _nameInputController = TextEditingController();

  @override
  void dispose() {
    _nameInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameInputController.text =
        context.read<PlayerController>().state.player?.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayerController, PlayerState>(
      listener: (context, state) {
        if (state.player == null) {
          _nameInputController.clear();
        } else {
          _nameInputController.text = state.player!.name;
        }
      },
      listenWhen: (prev, curr) {
        if (prev.player != null && curr.player == null) {
          return true;
        }
        if (_nameInputController.text == '' && curr.player != null) {
          return true;
        }
        return false;
      },
      child: Container(
        width: 220,
        height: 70,
        padding: EdgeInsets.all(context.dsTokens.spacing.medium),
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Player Name'),
          controller: _nameInputController,
          onFieldSubmitted: (value) =>
              context.read<PlayerController>().setPlayer(name: value),
        ),
      ),
    );
  }
}
