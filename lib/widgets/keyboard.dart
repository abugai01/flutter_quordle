import 'package:flutter/material.dart';
import 'package:flutter_quordle_app/models/keyboard_model.dart';
import 'package:flutter_quordle_app/widgets/keyboard_button.dart';

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
              KeyboardButton(letter: keyboard.letters['Q']),
              KeyboardButton(letter: keyboard.letters['W']),
              KeyboardButton(letter: keyboard.letters['E']),
              KeyboardButton(letter: keyboard.letters['R']),
              KeyboardButton(letter: keyboard.letters['T']),
              KeyboardButton(letter: keyboard.letters['Y']),
              KeyboardButton(letter: keyboard.letters['U']),
              KeyboardButton(letter: keyboard.letters['I']),
              KeyboardButton(letter: keyboard.letters['O']),
              KeyboardButton(letter: keyboard.letters['P']),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              KeyboardButton(letter: keyboard.letters['A']),
              KeyboardButton(letter: keyboard.letters['S']),
              KeyboardButton(letter: keyboard.letters['D']),
              KeyboardButton(letter: keyboard.letters['F']),
              KeyboardButton(letter: keyboard.letters['G']),
              KeyboardButton(letter: keyboard.letters['H']),
              KeyboardButton(letter: keyboard.letters['J']),
              KeyboardButton(letter: keyboard.letters['K']),
              KeyboardButton(letter: keyboard.letters['L']),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const KeyboardButton(buttonType: KeyboardButtonType.enter),
              KeyboardButton(letter: keyboard.letters['Z']),
              KeyboardButton(letter: keyboard.letters['X']),
              KeyboardButton(letter: keyboard.letters['C']),
              KeyboardButton(letter: keyboard.letters['V']),
              KeyboardButton(letter: keyboard.letters['B']),
              KeyboardButton(letter: keyboard.letters['N']),
              KeyboardButton(letter: keyboard.letters['M']),
              const KeyboardButton(buttonType: KeyboardButtonType.remove),
            ]),
          ]),
    ]);
  }
}
