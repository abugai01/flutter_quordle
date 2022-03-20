import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/cubits/game_cubit.dart';
import 'package:flutter_quordle_app/models/button_model.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';

class KeyboardLetterButton extends StatelessWidget {
  final ButtonModel? model;

  const KeyboardLetterButton(this.model, {Key? key})
      : assert(model != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width *
        keyboardLetterButtonScreenWidthFactor;
    final double height =
        MediaQuery.of(context).size.height * keyboardButtonScreenHeightFactor;

    return GestureDetector(
      onTap: () {
        context.read<GameCubit>().addLetter(LetterModel(model!.char));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Container(
          height: height,
          width: width,
          // decoration: const BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(5)),
          // ),
          child: Stack(children: [
            Column(children: [
              Expanded(
                child: Row(children: [
                  Expanded(
                      child: Container(
                          color: _getBackgroundColor(model!.states[0]))),
                  Expanded(
                      child: Container(
                          color: _getBackgroundColor(model!.states[1]))),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                      child: Container(
                          color: _getBackgroundColor(model!.states[2]))),
                  Expanded(
                      child: Container(
                          color: _getBackgroundColor(model!.states[3]))),
                ]),
              ),
            ]),
            Align(
              alignment: Alignment.center,
              child: Text(
                model!.char,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: black
                    //_getLetterColorByState(letter!.state
                    //todo: null safety!
                    ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Color _getBackgroundColor(LetterState? state) {
    switch (state) {
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
  }

  // Color _getLetterColorByState(LetterState state) {
  //   if (state == LetterState.unchecked) {
  //     return black;
  //   } else {
  //     return white;
  //   }
  // }
}
