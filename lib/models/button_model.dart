import 'package:flutter_quordle_app/config/constants.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';

class ButtonModel {
  final String char;
  Map<int, LetterState> states;

  ButtonModel(this.char)
      : assert(char.length <= 1),
        states = {} {
    _fillFieldStates();
  }

  void _fillFieldStates() {
    // Each states correspond to a certain field
    for (int i = 0; i < Constants.numberOfWordsInField; i++) {
      states[i] = LetterState.unchecked;
    }
  }

  bool get isEmpty => char == '';
}
