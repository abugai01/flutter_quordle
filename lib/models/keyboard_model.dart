import 'dart:core';

import 'package:flutter_quordle_app/helpers/keyboard_helper.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';
import 'package:flutter_quordle_app/models/word_model.dart';

class KeyboardModel {
  Map<String, LetterModel> letters;

  KeyboardModel() : letters = <String, LetterModel>{} {
    _fillLetters();
  }

  void _fillLetters() {
    for (int i = 0; i < KeyboardHelper.letters.length; i++) {
      letters[KeyboardHelper.letters[i]] =
          LetterModel(KeyboardHelper.letters[i]);
    }
  }

  //TODO: no need to check everything, only the last submitted word
  void updateKeyboard(Map<int, WordModel> words) {
    // Note that such looping though the map is only possible cause we have it numbered sequentially
    for (int i = 0; i < words.length; i++) {
      for (int j = 0; j < words[i]!.model.length; j++) {
        // If a correct spot has been found, just mark the letter green
        if (words[i]!.model[j]!.state == LetterState.correctSpot) {
          letters[words[i]!.model[j]!.char]!.state = LetterState.correctSpot;
        }
        // If a wrong spot has been found, make sure that the correct spot hasn't been found elsewhere and then mark the letter yellow
        else if (words[i]!.model[j]!.state == LetterState.wrongSpotButPresent &&
            letters[words[i]!.model[j]!.char]!.state !=
                LetterState.correctSpot) {
          letters[words[i]!.model[j]!.char]!.state =
              LetterState.wrongSpotButPresent;
        }
        // If a non-present letter has been found, mark it grey
        else if (words[i]!.model[j]!.state == LetterState.notPresent) {
          letters[words[i]!.model[j]!.char]!.state = LetterState.notPresent;
        }
      }
    }
  }
}
