import 'package:flutter/material.dart';

showInformationWindow(BuildContext context,
        {String? title, required Widget content}) =>
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => InformationWindow(
              title: title,
              content: content,
            ));

// TODO: add cupertino style window too
class InformationWindow extends StatelessWidget {
  final String? title;
  final Widget content;

  const InformationWindow({this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      title: title == null
          ? const SizedBox()
          : Text(
              title!,
              textAlign: TextAlign.center,
            ),
      content: content,
    );
  }
}
