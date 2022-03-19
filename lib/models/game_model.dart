import 'dart:developer';

import 'package:flutter_quordle_app/config/constants.dart';
import 'package:flutter_quordle_app/helpers/word_helper.dart';
import 'package:flutter_quordle_app/models/enums/field_state_enum.dart';
import 'package:flutter_quordle_app/models/enums/game_state_enum.dart';
import 'package:flutter_quordle_app/models/field_model.dart';
import 'package:flutter_quordle_app/models/keyboard_model.dart';
import 'package:flutter_quordle_app/models/word_model.dart';

//todo: check if the game is won or not?
class GameModel {
  //int activeCellIndex;
  //int activeWordIndex;
  Map<int, FieldModel> fields;
  KeyboardModel keyboard;
  GameState gameResult;

  GameModel.start()
      :
        //activeCellIndex = 0,
        //activeWordIndex = 0,
        gameResult = GameState.active,
        fields = <int, FieldModel>{},
        keyboard = KeyboardModel() {
    _prepareFields();
  }

  void _prepareFields() {
    for (int i = 0; i < Constants.numberOfFields; i++) {
      fields[i] = FieldModel.start();
    }
  }

  void _updateGameResult() {
    for (FieldModel field in fields.values) {
      log(field.fieldResult.toString());
      if (field.fieldResult == FieldState.active) {
        gameResult = GameState.active;
        return;
      } else if (field.fieldResult == FieldState.lost) {
        gameResult = GameState.lost;
        return;
      }
    }

    gameResult = GameState.won;
  }

  //todo: is it a good solution?
  //todo: at least rename, this is latest active word or idk
  WordModel? get currentWord => _currentWord();
  WordModel? _currentWord() {
    for (FieldModel field in fields.values) {
      if (field.fieldResult == FieldState.active) {
        return field.currentWord;
      }
    }
    return null;
  }

  //todo: make sure some checks are at the game level!
  void submitWord() {
    //todo: think about current word - it should be here in game model!
    if (gameResult != GameState.active || isCurrentWordComplete == false) {
      return;
    }

    //todo: check if the word is valid here?

    for (FieldModel field in fields.values) {
      field.submitWord();
    }

    keyboard
        .updateKeyboard(fields[0]!.words); //todo: adapt keyboard to 4 inputs!

    _updateGameResult();
  }

  bool get isCurrentWordValid => WordHelper.isValidWord(currentWord.toString());
  bool get isCurrentWordComplete =>
      currentWord?.isWordComplete() ?? false; //todo: null safety
}
