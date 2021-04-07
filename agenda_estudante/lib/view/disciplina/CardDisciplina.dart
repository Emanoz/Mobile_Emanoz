import 'package:agenda_estudante/model/Disciplina.dart';
import 'package:agenda_estudante/view/tarefa/CardTarefa.dart';
import 'package:flutter/material.dart';

class CardDisciplina extends StatelessWidget {
  final Disciplina disciplina;

  CardDisciplina(this.disciplina);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CardTarefa())),
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          margin: EdgeInsets.all(24),
          color: Colors.lightBlue[100],
          height: 180,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Text(disciplina.titulo),
                    Text(disciplina.periodo),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/${disciplina.imagem}',
                  semanticLabel: disciplina.titulo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(disciplina.professor),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
