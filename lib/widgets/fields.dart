import 'package:flutter/material.dart';
import 'package:flutter_quordle_app/models/field_model.dart';
import 'package:flutter_quordle_app/models/letter_model.dart';
import 'package:flutter_quordle_app/models/word_model.dart';
import 'package:flutter_quordle_app/widgets/cell.dart';

class Fields extends StatelessWidget {
  final Map<int, FieldModel> fields;

  Fields(this.fields, {Key? key}) : super(key: key) {
    // Hardcoded cause the widget below is only suitable for 4 fields
    assert(fields.length == 4);
    assert(fields[0] != null);
    assert(fields[1] != null);
    assert(fields[2] != null);
    assert(fields[3] != null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Expanded(child: Container()),
        Column(children: [
          Row(children: [
            _genField(fields[0]!.words),
            const SizedBox(width: 15),
            _genField(fields[1]!.words)
          ]),
          const SizedBox(height: 25),
          Row(children: [
            _genField(fields[2]!.words),
            const SizedBox(width: 15),
            _genField(fields[3]!.words)
          ]),
        ]),
        Expanded(child: Container()),
      ]),
    );
  }

  Widget _genField(Map<int, WordModel> words) =>
      Column(children: _genGrid(words));

  List<Widget> _genGrid(Map<int, WordModel> words) {
    List<Widget> res = [];

    for (WordModel word in words.values) {
      res.add(Row(children: _genRow(word)));
    }

    return res;
  }

  List<Widget> _genRow(WordModel word) {
    List<Widget> res = [];

    for (LetterModel letter in word.model.values) {
      res.add(Cell(letter, isActive: word.isActive));
    }

    return res;
  }
}
