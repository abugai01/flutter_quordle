import 'package:flutter_quordle_app/config/constants.dart';
import 'package:flutter_quordle_app/models/enums/letter_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';

class WordModel {
  late Map<int, LetterModel> model;
  bool isActive;

  // This constructor is only used to generate a winner word at the beginning of a game
  WordModel(String word)
      : assert(word.length == Constants.lettersInWord),
        model = <int, LetterModel>{},
        isActive = false {
    _fillModel(word);
  }

  WordModel.empty({this.isActive = false}) {
    model = _genEmptyModel();
  }

  void _fillModel(String word) {
    for (int i = 0; i < word.length; i++) {
      model[i] = LetterModel(word[i]);
    }
  }

  Map<int, LetterModel> _genEmptyModel() {
    Map<int, LetterModel> res = {};

    for (int i = 0; i < Constants.lettersInWord; i++) {
      res[i] = LetterModel('');
    }

    return res;
  }

  void addLetter(int index, LetterModel letter) {
    assert(index >= 0 && index < Constants.lettersInWord);

    // Important to create a brand new letter with an unchecked state
    model[index] = LetterModel(letter.char);
  }

  void removeLetter(int index) {
    assert(index >= 0 && index < Constants.lettersInWord);

    model[index] = LetterModel('');
  }

  void check(String word) {
    assert(word.length == Constants.lettersInWord);
    assert(word.length == model.length);

    // TODO: probably shouldn't iterate through loops this way
    for (int i = 0; i < word.length; i++) {
      if (model[i]!.char == word[i]) {
        model[i]!.state = LetterState.correctSpot;
      } else if (word.contains(model[i]!.char)) {
        model[i]!.state = LetterState.wrongSpotButPresent;
      } else {
        model[i]!.state = LetterState.notPresent;
      }
    }
  }

  @override
  String toString() {
    String res = '';

    for (int i = 0; i < model.length; i++) {
      res += model[i]!.char;
    }

    return res;
  }

  bool isEqual(WordModel anotherWord) => toString() == anotherWord.toString();

  bool isWordComplete() {
    bool res = true;

    for (LetterModel letter in model.values) {
      if (letter.isEmpty == true) {
        res = false;
      }
    }

    return res;
  }
}
