import 'package:flutter/material.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';
import 'package:flutter_quordle_app/widgets/cell.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextAlign align = TextAlign.center;
    const TextStyle style = TextStyle(color: darkGrey, fontSize: 14);

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          const Text(
            "Guess the mystery 5 letter word in 6 tries!",
            textAlign: align,
            style: style,
          ),
          const SizedBox(height: 20),
          const Text(
            "After each guess, the letters will change color to show how close you were to the actual word:",
            textAlign: align,
            style: style,
          ),
          const _ExampleGrid(),
          RichText(
            textAlign: align,
            text: const TextSpan(
              text: 'Grey',
              style: TextStyle(color: grey, fontSize: 12.5),
              children: <TextSpan>[
                TextSpan(
                  text: ' – the letter is not in the word',
                  style: TextStyle(color: grey, fontSize: 12.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            textAlign: align,
            text: const TextSpan(
              text: 'Yellow',
              style: TextStyle(color: yellow, fontSize: 12.5),
              children: <TextSpan>[
                TextSpan(
                  text: ' – the letter is in the word but in the wrong place',
                  style: TextStyle(color: grey, fontSize: 12.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            textAlign: align,
            text: const TextSpan(
              text: 'Green',
              style: TextStyle(color: green, fontSize: 12.5),
              children: <TextSpan>[
                TextSpan(
                  text: ' – the letter is correct',
                  style: TextStyle(color: grey, fontSize: 12.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Keep guessing to find the correct answer!",
            textAlign: align,
            style: style,
          ),
          const SizedBox(height: 15),
        ]);
  }
}

class _ExampleGrid extends StatelessWidget {
  const _ExampleGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(children: [
        Expanded(child: Container()),
        Column(children: [
          Row(children: [
            Cell.small(LetterModel.overrideState('C',
                state: LetterState.wrongSpotButPresent)),
            Cell.small(LetterModel.overrideState('H',
                state: LetterState.wrongSpotButPresent)),
            Cell.small(
                LetterModel.overrideState('A', state: LetterState.notPresent)),
            Cell.small(
                LetterModel.overrideState('I', state: LetterState.notPresent)),
            Cell.small(
                LetterModel.overrideState('R', state: LetterState.notPresent)),
          ]),
          Row(children: [
            Cell.small(
                LetterModel.overrideState('R', state: LetterState.notPresent)),
            Cell.small(
                LetterModel.overrideState('E', state: LetterState.notPresent)),
            Cell.small(
                LetterModel.overrideState('A', state: LetterState.notPresent)),
            Cell.small(
                LetterModel.overrideState('C', state: LetterState.correctSpot)),
            Cell.small(
                LetterModel.overrideState('H', state: LetterState.correctSpot)),
          ]),
          Row(children: [
            Cell.small(
                LetterModel.overrideState('L', state: LetterState.correctSpot)),
            Cell.small(
                LetterModel.overrideState('U', state: LetterState.correctSpot)),
            Cell.small(
                LetterModel.overrideState('N', state: LetterState.correctSpot)),
            Cell.small(
                LetterModel.overrideState('C', state: LetterState.correctSpot)),
            Cell.small(
                LetterModel.overrideState('H', state: LetterState.correctSpot)),
          ]),
        ]),
        Expanded(child: Container()),
      ]),
    );
  }
}
