import 'dart:core';

import 'package:flutter_quordle_app/models/enums/keyboard_row_type_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';

class KeyboardHelper {
  static const _topRow = <String>[
    'Q',
    'W',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P',
  ];
  static const _middleRow = <String>[
    'A',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'P',
  ];
  static const _bottomRow = <String>[
    'Z',
    'X',
    'C',
    'V',
    'B',
    'N',
    'M',
  ];

  static List<String> get letters => _topRow + _middleRow + _bottomRow;

  static List<String> getRowByType(KeyboardRowType type) {
    switch (type) {
      case KeyboardRowType.top:
        return _topRow;
      case KeyboardRowType.middle:
        return _middleRow;
      case KeyboardRowType.bottom:
        return _bottomRow;
    }
  }

  static bool isRowType(LetterModel letter, KeyboardRowType type) {
    if (type == KeyboardRowType.top && _topRow.contains(letter.char)) {
      return true;
    } else if (type == KeyboardRowType.middle &&
        _middleRow.contains(letter.char)) {
      return true;
    } else if (type == KeyboardRowType.bottom &&
        _bottomRow.contains(letter.char)) {
      return true;
    } else {
      return false;
    }
  }
}
