import 'package:agenda_estudante/view/dashboard.dart';
import 'package:agenda_estudante/view/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: LoginAndRegisterPage(),
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.purple,
              accentColor: Colors.blue,
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
