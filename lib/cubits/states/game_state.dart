import 'package:flutter_quordle_app/models/game_model.dart';

abstract class GameCubitState {}

class GameInitState extends GameCubitState {}

class GameGenericState extends GameCubitState {
  final GameModel game;

  GameGenericState({required this.game});
}
