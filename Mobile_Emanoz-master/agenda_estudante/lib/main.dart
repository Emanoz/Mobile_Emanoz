import 'package:agenda_estudante/view/Dashboard.dart';
import 'package:agenda_estudante/view/tarefa/CardTarefaAnexo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Dashboard(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        accentColor: Colors.blue,
      ),
    ),
  );
}
