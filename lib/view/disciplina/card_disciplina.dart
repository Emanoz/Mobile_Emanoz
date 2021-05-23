import 'package:agenda_estudante/components/default_text_styles.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:agenda_estudante/view/tarefa/card_tarefa.dart';
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
                    Text(
                      disciplina.titulo,
                      style: DefaultTextStyles.cardStyle(),
                    ),
                    Text(
                      disciplina.periodo,
                      style: DefaultTextStyles.cardStyle(),
                    ),
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
                child: Text(
                  disciplina.professor,
                  style: DefaultTextStyles.cardStyle(),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
