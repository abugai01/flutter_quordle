import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quordle_app/cubits/states/game_state.dart';
import 'package:flutter_quordle_app/models/field_model.dart';
import 'package:flutter_quordle_app/models/game_model.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';
import 'package:flutter_quordle_app/widgets/show_alert_window.dart';

//todo: at the end remove _field from here?
class GameCubit extends Cubit<GameCubitState> {
  late GameModel _game;
  //late FieldModel _field;

  GameCubit() : super(GameInitState()) {
    //_field = FieldModel.start();
    _game = GameModel.start();
    emit(GameGenericState(
        //field: _field,
        game: _game));
  }

  void addLetter(LetterModel letter) {
    for (FieldModel field in _game.fields.values) {
      field.addLetter(
          letter); //todo: is it actually updated or not when iterated like this?
    }
    emit(GameGenericState(game: _game));
  }

  void removeLetter() {
    for (FieldModel field in _game.fields.values) {
      field
          .removeLetter(); //todo: is it actually updated or not when iterated like this?
    }
    emit(GameGenericState(game: _game));
  }

  void trySubmitWord(BuildContext context) {
    if (_game.isCurrentWordComplete == false) {
      return;
    }

    //todo: maybe a red validation text is better?
    if (_game.isCurrentWordValid == false) {
      showAlertWindow(context,
          title: 'Invalid word', subtitle: 'Not in word list');
      return;
    } else {
      _game.submitWord();

      emit(GameGenericState(game: _game));
    }
  }

  void newGame() {
    _game = GameModel.start();
    emit(GameGenericState(game: _game));
  }
}
