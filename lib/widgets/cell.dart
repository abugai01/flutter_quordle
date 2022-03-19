import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';

class Cell extends StatelessWidget {
  final LetterModel letter;
  final bool isActive;

  const Cell(this.letter, {this.isActive = false, Key? key}) : super(key: key);

  // This constructor is used for creating a rules explanation screen only!
  const Cell.small(this.letter, {Key? key})
      : isActive = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height *
        (isActive == true
            ? activeCellScreenHeightFactor
            : inactiveCellScreenHeightFactor);
    final double width =
        MediaQuery.of(context).size.width * cellScreenWidthFactor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(letter)),
          color: _getBackgroundColor(letter, isActive),
        ),
        child: _CellLetter(
          letter,
          isActive: isActive,
        ),
      ),
    );
  }

  Color _getBackgroundColor(LetterModel letter, bool isActive) {
    if (isActive == true && letter.state == LetterState.unchecked) {
      return extraLightGrey;
    } else {
      switch (letter.state) {
        case LetterState.correctSpot:
          return green;
        case LetterState.wrongSpotButPresent:
          return yellow;
        case LetterState.notPresent:
          return grey;
        case LetterState.unchecked:
          return white;
        default:
          return white;
      }
    }
  }

  //todo :maybe highlight better current input?
  //todo: remove unnecessary borders!
  Color _getBorderColor(LetterModel letter) {
    if (letter.isEmpty == true) {
      return lightGrey;
    } else {
      if (letter.state == LetterState.unchecked) {
        return darkGrey;
      } else {
        return grey;
      }
    }
  }
}

class _CellLetter extends StatelessWidget {
  final LetterModel letter;
  final bool isSmall; //todo: remove is unused
  final bool isActive;

  const _CellLetter(this.letter,
      {this.isSmall = false, this.isActive = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Text(letter.char,
            style: TextStyle(
                fontSize: isActive == true ? 22 : 14,
                color: _getLetterColorByState(letter.state),
                fontWeight:
                    isActive == true ? FontWeight.bold : FontWeight.normal)));
  }

  Color _getLetterColorByState(state) {
    if (state == LetterState.unchecked) {
      return black;
    } else {
      return white;
    }
  }
}
