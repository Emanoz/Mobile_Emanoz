import 'package:agenda_estudante/controller/firebase_auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget signOut(BuildContext context) {
  return IconButton(
    onPressed: () => FirebaseUserAuthController().signOut(context),
    icon: Icon(Icons.exit_to_app),
  );
}
