import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/cubits/game_cubit.dart';
import 'package:flutter_quordle_app/models/game_model.dart';
import 'package:flutter_quordle_app/widgets/custom_button.dart';
import 'package:flutter_quordle_app/widgets/result_info_text.dart';

class ResultPanel extends StatelessWidget {
  final GameModel game;

  const ResultPanel(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //todo: show winners!
          //ResultInfoText(field.fieldResultState, answer: field.winnerWord.toString()),
          ResultInfoText(game.gameResult,
              answer: game.fields[0]!.winnerWord.toString() +
                  ' ' +
                  game.fields[1]!.winnerWord.toString() +
                  ' ' +
                  game.fields[2]!.winnerWord.toString() +
                  ' ' +
                  game.fields[3]!.winnerWord.toString()),
          const SizedBox(height: 18),
          Row(children: <Widget>[
            Expanded(child: Container()),
            CustomButton(
              'STATS',
              function: () {
                // TODO: implement!
              },
              color: darkGrey,
            ),
            const SizedBox(width: 15),
            CustomButton(
              'NEW GAME',
              function: () {
                context.read<GameCubit>().newGame();
              },
              color: green,
            ),
            Expanded(child: Container()),
          ]),
        ]);
  }
}
