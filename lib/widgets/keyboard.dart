import 'package:flutter/material.dart';
import 'package:flutter_quordle_app/models/keyboard_model.dart';
import 'package:flutter_quordle_app/widgets/keyboard_letter_button.dart';
import 'package:flutter_quordle_app/widgets/keyboard_special_button.dart';

class Keyboard extends StatelessWidget {
  final KeyboardModel keyboard;

  const Keyboard(this.keyboard, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              KeyboardLetterButton(keyboard.buttons['Q']),
              KeyboardLetterButton(keyboard.buttons['W']),
              KeyboardLetterButton(keyboard.buttons['E']),
              KeyboardLetterButton(keyboard.buttons['R']),
              KeyboardLetterButton(keyboard.buttons['T']),
              KeyboardLetterButton(keyboard.buttons['Y']),
              KeyboardLetterButton(keyboard.buttons['U']),
              KeyboardLetterButton(keyboard.buttons['I']),
              KeyboardLetterButton(keyboard.buttons['O']),
              KeyboardLetterButton(keyboard.buttons['P']),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              KeyboardLetterButton(keyboard.buttons['A']),
              KeyboardLetterButton(keyboard.buttons['S']),
              KeyboardLetterButton(keyboard.buttons['D']),
              KeyboardLetterButton(keyboard.buttons['F']),
              KeyboardLetterButton(keyboard.buttons['G']),
              KeyboardLetterButton(keyboard.buttons['H']),
              KeyboardLetterButton(keyboard.buttons['J']),
              KeyboardLetterButton(keyboard.buttons['K']),
              KeyboardLetterButton(keyboard.buttons['L']),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const KeyboardSpecialButton(
                  buttonType: KeyboardSpecialButtonType.enter),
              KeyboardLetterButton(keyboard.buttons['Z']),
              KeyboardLetterButton(keyboard.buttons['X']),
              KeyboardLetterButton(keyboard.buttons['C']),
              KeyboardLetterButton(keyboard.buttons['V']),
              KeyboardLetterButton(keyboard.buttons['B']),
              KeyboardLetterButton(keyboard.buttons['N']),
              KeyboardLetterButton(keyboard.buttons['M']),
              const KeyboardSpecialButton(
                  buttonType: KeyboardSpecialButtonType.remove),
            ]),
          ]),
    ]);
  }
}
