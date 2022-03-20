import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quordle_app/config/style.dart';
import 'package:flutter_quordle_app/cubits/game_cubit.dart';

class KeyboardSpecialButton extends StatelessWidget {
  final KeyboardSpecialButtonType buttonType;

  const KeyboardSpecialButton({required this.buttonType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width *
        keyboardLargeButtonScreenWidthFactor;
    final double height =
        MediaQuery.of(context).size.height * keyboardButtonScreenHeightFactor;

    return GestureDetector(
      onTap: () {
        if (buttonType == KeyboardSpecialButtonType.enter) {
          context.read<GameCubit>().trySubmitWord(context);
        } else if (buttonType == KeyboardSpecialButtonType.remove) {
          context.read<GameCubit>().removeLetter();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: _genChildByType(buttonType),
        ),
      ),
    );
  }

  Widget _genChildByType(KeyboardSpecialButtonType type) {
    switch (type) {
      case KeyboardSpecialButtonType.enter:
        return const Align(
            alignment: Alignment.center,
            child: Text('ENTER',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)));
      case KeyboardSpecialButtonType.remove:
        return const Icon(Icons.backspace_outlined);
    }
  }
}

enum KeyboardSpecialButtonType { enter, remove }
