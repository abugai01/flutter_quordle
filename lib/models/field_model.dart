import 'package:flutter_quordle_app/config/constants.dart';
import 'package:flutter_quordle_app/helpers/word_helper.dart';
import 'package:flutter_quordle_app/models/enums/field_state_enum.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';
import 'package:flutter_quordle_app/models/word_model.dart';

//todo: active word should be passed!
class FieldModel {
  int activeCellIndex;
  int activeWordIndex;
  Map<int, WordModel> words;
  FieldState fieldResult;
  late WordModel winnerWord;

  FieldModel.start()
      : activeCellIndex = 0,
        activeWordIndex = 0,
        fieldResult = FieldState.active,
        words = <int, WordModel>{} {
    _prepareWords();
    _selectWinner();
  }

  void _prepareWords() {
    for (int i = 0; i < Constants.numberOfWordsInField; i++) {
      words[i] = WordModel.empty();
    }

    words[0]!.isActive = true;
  }

  void addLetter(LetterModel letter) {
    if (fieldResult != FieldState.active || isCurrentWordComplete == true) {
      return;
    }

    words[activeWordIndex]!.addLetter(activeCellIndex, letter);

    if (!isAtLastLetterOfWord) {
      activeCellIndex += 1;
      assert(activeCellIndex >= 0 && activeCellIndex < Constants.lettersInWord);
    }

    //log("added letter, now activeCellIndex is: " + activeCellIndex.toString());
  }

  void removeLetter() {
    if (fieldResult != FieldState.active) {
      return;
    }

    if (!isAtFirstLetterOfWord) {
      // What the next couple of rows mean is that the focus doesn't move to the previous cell, if we are at the last letter of the word and it is not empty
      // Basically, it means that we have to remove the last letter first, because it is not empty, and only then go the previous cell
      if (!(isAtLastLetterOfWord &&
          words[activeWordIndex]!.model[activeCellIndex]!.isEmpty == false)) {
        activeCellIndex -= 1;
        assert(
            activeCellIndex >= 0 && activeCellIndex < Constants.lettersInWord);
      }
    }
    words[activeWordIndex]!.removeLetter(activeCellIndex);

    //log("removed letter, now activeCellIndex is: " + activeCellIndex.toString());
  }

  //todo: make sure some checks are at the game level!
  //todo: current word should be passed!
  void checkWord() {
    //todo: maybe remove checking is the current word is completed, as the same goes in the game model!
    if (fieldResult != FieldState.active || isCurrentWordComplete == false) {
      return;
    }

    words[activeWordIndex]!.check(winnerWord.toString());
  }

  void nextMove() {
    if (isWon == true) {
      fieldResult = FieldState.won;
      return;
    } else {
      if (isAtLastWord == true) {
        fieldResult = FieldState.lost;
        return;
      } else {
        activeCellIndex = 0;
        assert(
            activeCellIndex >= 0 && activeCellIndex < Constants.lettersInWord);

        words[activeWordIndex]!.isActive = false;
        activeWordIndex += 1;
        words[activeWordIndex]!.isActive = true;
        assert(activeWordIndex >= 0 &&
            activeWordIndex < Constants.numberOfWordsInField);
      }
    }
  }

  void _selectWinner() {
    winnerWord = WordModel(WordHelper().getRandomWord());
  }

  bool get isWon => currentWord.isEqual(winnerWord) == true;
  bool get isAtFirstLetterOfWord => activeCellIndex == 0;
  bool get isAtLastLetterOfWord =>
      activeCellIndex == Constants.lettersInWord - 1;
  // bool get isAtLastLetterOfField =>
  //     activeWordIndex == Constants.numberOfWords - 1 &&
  //     isAtLastLetterOfWord == true;
  bool get isAtLastWord =>
      activeWordIndex == Constants.numberOfWordsInField - 1;
  WordModel get currentWord => words[activeWordIndex]!;
  bool get isCurrentWordValid => WordHelper.isValidWord(currentWord.toString());
  bool get isCurrentWordComplete => words[activeWordIndex]!.isWordComplete();
}
