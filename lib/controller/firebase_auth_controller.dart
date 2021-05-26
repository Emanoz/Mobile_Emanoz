import 'package:agenda_estudante/view/dashboard.dart';
import 'package:agenda_estudante/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseUserAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  Future<void> signOut(BuildContext context) async {
    final user = _auth.currentUser;
    if (user == null) {
      print("usuário não logado");
      return;
    }
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }

  void signIn(BuildContext context) async {
    User user;

    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: senha.text,
      ))
          .user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Usuário ou senha incorretos! Tente novamente"),
        ));
      }
      return;
    }

    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login falhou! Tente novamente"),
    ));
  }

  void register(BuildContext context) async {
    User user;

    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: senha.text,
      ))
          .user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("E-mail já utilizado ou inválido! Tente novamente"),
        ));
      }
      return;
    }

    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginAndRegisterPage()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registrado com sucesso!"),
      ));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Registro falhou! Tente novamente"),
    ));
  }
}
