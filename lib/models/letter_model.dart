import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';

class LetterModel {
  final String char;
  LetterState state;

  LetterModel(this.char)
      : assert(char.length <= 1),
        state = LetterState.unchecked;

  // This constructor is used for creating a rules explanation screen only!
  LetterModel.overrideState(this.char, {required this.state})
      : assert(char.length <= 1);

  bool get isEmpty => char == '';
}
