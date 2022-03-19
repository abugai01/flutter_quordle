import 'package:flutter/material.dart';

showAlertWindow(BuildContext context,
        {String? title,
        String? subtitle,
        String? actionText,
        Color? actionColor}) =>
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertWindow(
              title: title,
              subtitle: subtitle,
              actionText: actionText,
              actionColor: actionColor,
            ));

// TODO: add cupertino style window too
class AlertWindow extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? actionText;
  final Color? actionColor;

  const AlertWindow(
      {this.title, this.subtitle, this.actionText, this.actionColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null ? const SizedBox() : Text(title!),
      content: subtitle == null ? const SizedBox() : Text(subtitle!),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(actionText ?? 'OK',
              style: TextStyle(color: actionColor ?? Colors.blue)),
        ),
      ],
    );
  }
}
