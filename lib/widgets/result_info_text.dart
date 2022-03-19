import 'package:flutter/material.dart';
import 'package:flutter_quordle_app/models/enums/game_state_enum.dart';

class ResultInfoText extends StatelessWidget {
  final GameState result;
  final String? answer;

  const ResultInfoText(this.result, {this.answer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = _genText(result, answer);

    return Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }

  String _genText(GameState result, String? answer) {
    String res = '';

    if (result == GameState.won) {
      res = 'YOU WON!';
    } else if (result == GameState.lost) {
      res = 'YOU LOST!' +
          (answer == null ? '' : (' - ' + answer)); //todo: pass answers!
    }

    return res;
  }
}
