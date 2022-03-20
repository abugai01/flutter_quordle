import 'dart:core';
import 'dart:developer';

import 'package:flutter_quordle_app/config/constants.dart';
import 'package:flutter_quordle_app/helpers/keyboard_helper.dart';
import 'package:flutter_quordle_app/models/button_model.dart';
import 'package:flutter_quordle_app/models/enums/field_state_enum.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/field_model.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';

class KeyboardModel {
  Map<String, ButtonModel> buttons;

  KeyboardModel() : buttons = <String, ButtonModel>{} {
    _fillLetters();
  }

  void _fillLetters() {
    for (int i = 0; i < KeyboardHelper.letters.length; i++) {
      buttons[KeyboardHelper.letters[i]] =
          ButtonModel(KeyboardHelper.letters[i]);
    }
  }

  //TODO: no need to check everything, only the last submitted word

  void updateKeyboard(Map<int, FieldModel> fields) {
    log(buttons['G']!.states[0].toString());
    log(buttons['G']!.states[1].toString());
    log(buttons['G']!.states[2].toString());
    log(buttons['G']!.states[3].toString());

    assert(fields.length == Constants.numberOfFields);

    for (int i = 0; i < Constants.numberOfFields; i++) {
      assert(fields[i] != null);

      //todo: field state is probably better than result?
      if (fields[i]!.fieldResult == FieldState.active) {
        for (LetterModel letter in fields[i]!.currentWord.model.values) {
          log(letter.char);
          log(letter.state.toString());

          // If a correct spot has been found, just mark the letter green
          if (letter.state == LetterState.correctSpot) {
            //todo: null safety here?
            buttons[letter.char]!.states[i] = LetterState.correctSpot;
          }
          // If a wrong spot has been found, make sure that the correct spot hasn't been found elsewhere and then mark the letter yellow
          else if (letter.state == LetterState.wrongSpotButPresent &&
              buttons[letter.char]!.states[i] != LetterState.correctSpot) {
            //todo: null safety here?
            buttons[letter.char]!.states[i] = LetterState.wrongSpotButPresent;
          }
          // If a non-present letter has been found, mark it grey
          else if (letter.state == LetterState.notPresent) {
            buttons[letter.char]!.states[i] = LetterState.notPresent;
          }
          //todo: what about pointless moves?
        }
      }
    }
  }
}
