import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/cubits/game_cubit.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';

class KeyboardButton extends StatelessWidget {
  final LetterModel? letter;
  final KeyboardButtonType buttonType;

  const KeyboardButton(
      {this.letter, this.buttonType = KeyboardButtonType.letter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width *
        (buttonType == KeyboardButtonType.letter
            ? keyboardLetterButtonScreenWidthFactor
            : keyboardLargeButtonScreenWidthFactor);
    final double height =
        MediaQuery.of(context).size.height * keyboardButtonScreenHeightFactor;

    return GestureDetector(
      onTap: () {
        if (buttonType == KeyboardButtonType.letter) {
          assert(letter != null);
          context.read<GameCubit>().addLetter(letter!);
        } else if (buttonType == KeyboardButtonType.enter) {
          context.read<GameCubit>().trySubmitWord(context);
        } else if (buttonType == KeyboardButtonType.remove) {
          context.read<GameCubit>().removeLetter();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: _getBackgroundColor(buttonType, letter),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: _genChildByType(buttonType, letter?.state),
        ),
      ),
    );
  }

  Color _getBackgroundColor(
      KeyboardButtonType buttonType, LetterModel? letter) {
    if (buttonType == KeyboardButtonType.letter && letter != null) {
      switch (letter.state) {
        case LetterState.correctSpot:
          return green;
        case LetterState.wrongSpotButPresent:
          return yellow;
        case LetterState.notPresent:
          return grey;
        case LetterState.unchecked:
          return lightGrey;
        default:
          return lightGrey;
      }
    } else {
      return lightGrey;
    }
  }

  Color _getLetterColorByState(LetterState? state) {
    if (state == LetterState.unchecked) {
      return black;
    } else {
      return white;
    }
  }

  Widget _genChildByType(KeyboardButtonType type, LetterState? letterState) {
    switch (type) {
      case KeyboardButtonType.letter:
        return Align(
            alignment: Alignment.center,
            child: Text(letter?.char ?? '',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getLetterColorByState(letterState))));
      case KeyboardButtonType.enter:
        return const Align(
            alignment: Alignment.center,
            child: Text('ENTER',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)));
      case KeyboardButtonType.remove:
        return const Icon(Icons.backspace_outlined);
    }
  }
}

enum KeyboardButtonType { letter, enter, remove }
