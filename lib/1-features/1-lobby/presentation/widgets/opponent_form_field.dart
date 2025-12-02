import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_cubit.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/utils/async_value.dart';

class OpponentFormField extends StatelessWidget {
  const OpponentFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .end,
      children: [
        const _PlayerTextField(),
        IconButton(
          onPressed: context.read<LobbyController>().clearOpponent,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}

class _PlayerTextField extends StatefulWidget {
  const _PlayerTextField();

  @override
  State<_PlayerTextField> createState() => _PlayerTextFieldState();
}

class _PlayerTextFieldState extends State<_PlayerTextField> {
  final TextEditingController _nameInputController = TextEditingController();

  @override
  void dispose() {
    _nameInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameInputController.text =
        context.read<LobbyController>().state.data?.opponent?.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Note : Listen state changes to update the text field controller
    // when opponent changes.
    return BlocListener<LobbyController, AsyncValue<LobbyData, void>>(
      listener: (context, state) {
        if (state.data?.opponent == null) {
          _nameInputController.clear();
        } else {
          _nameInputController.text = state.data!.opponent!.name;
        }
      },
      listenWhen: (prev, curr) {
        if (prev.data?.opponent != null && curr.data?.opponent == null) {
          return true;
        }
        if (_nameInputController.text == '' && curr.data?.opponent != null) {
          return true;
        }
        return false;
      },
      child: Container(
        width: 220,
        height: 70,
        padding: EdgeInsets.all(context.dsTokens.spacing.medium),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: l10n.lobby_field_opponent_label,
          ),
          controller: _nameInputController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<LobbyController>().setOpponent(name: value);
            }
          },
          onFieldSubmitted: (value) =>
              context.read<LobbyController>().setOpponent(name: value),
        ),
      ),
    );
  }
}
