import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/cubits/game_cubit.dart';
import 'package:flutter_quordle_app/cubits/states/game_state.dart';
import 'package:flutter_quordle_app/models/enums/game_state_enum.dart';
import 'package:flutter_quordle_app/widgets/fields.dart';
import 'package:flutter_quordle_app/widgets/keyboard.dart';
import 'package:flutter_quordle_app/widgets/result_panel.dart';
import 'package:flutter_quordle_app/widgets/rules.dart';
import 'package:flutter_quordle_app/widgets/show_information_window.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'QUORDLE',
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
        actions: [
          IconButton(
              onPressed: () => showInformationWindow(context,
                  title: 'HOW TO PLAY', content: const Rules()),
              icon: const Icon(
                Icons.help_outline_outlined,
                color: black,
              ))
        ],
      ),
      body: BlocProvider<GameCubit>(
        create: (context) => GameCubit(),
        child:
            BlocBuilder<GameCubit, GameCubitState>(builder: (context, state) {
          if (state is GameGenericState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 5),
                Expanded(flex: 7, child: Fields(state.game.fields)),
                const SizedBox(height: 25),
                Expanded(
                  flex: 2,
                  child: state.game.gameResult == GameState.active
                      ? Keyboard(state.game.keyboard)
                      : ResultPanel(state.game),
                ),
                const SizedBox(height: 10),
              ],
            );
          } else {
            return const Center(child: Text('Sorry, something went wrong'));
          }
        }),
      ),
    );
  }
}
