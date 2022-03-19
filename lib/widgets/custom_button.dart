import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String text;
  final Color? color;

  const CustomButton(this.text, {required this.function, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
          height: 60,
          child: MaterialButton(
              onPressed: () {
                function();
              },
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0,
              color: color ?? Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //side: BorderSide(color: Colors.red)
              ))),
    );
  }
}
