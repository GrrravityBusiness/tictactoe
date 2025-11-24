import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/theme/presentation/widget/theme_switcher.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Text('Hello World!'),
              ThemeSwitcherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
