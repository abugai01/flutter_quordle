import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quordle_app/pages/game_page.dart';

// TODO: implement stats
void main() async {
  // We need to call it manually, because we going to call setPreferredOrientations() before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we set up preferred orientations, and only then we run our app
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Wordle Clone',
      home: GamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
