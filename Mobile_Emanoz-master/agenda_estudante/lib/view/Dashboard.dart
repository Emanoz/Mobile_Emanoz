import 'package:agenda_estudante/components/DefaultScaffold.dart';
import 'package:agenda_estudante/model/Disciplina.dart';
import 'package:agenda_estudante/view/disciplina/CadastroDisciplina.dart';
import 'package:agenda_estudante/view/disciplina/CardDisciplina.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Disciplina de exemplo
    Disciplina disciplina = Disciplina(
        titulo: 'Cálculo II',
        periodo: '7º semestre',
        professor: 'Lúcia Maria da Silva',
        imagem: 'calculus.jpg');

    return DefaultScaffold(
      appBarTitle: 'Dashboard',
      appBarLeadingIcon: Icon(Icons.home),
      body: ListView(
        children: [
          Column(
            children: [
              // Exemplo de disciplinas antes de implementar o backend
              CardDisciplina(disciplina),
              CardDisciplina(disciplina),
              CardDisciplina(disciplina),
              CardDisciplina(disciplina),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      ),
      fabIcon: Icon(
        Icons.add,
        size: 50.0,
      ),
      fabNavigation: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => CadastroDisciplina())),
    );
  }
}
