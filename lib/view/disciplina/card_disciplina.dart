import 'dart:io';

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
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => CardTarefa(disciplina))),
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
                child: Image.file(
                  File(disciplina.imagem),
                  semanticLabel: disciplina.titulo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                        "https://cdn.neemo.com.br/uploads/settings_webdelivery/logo/3136/image-not-found.jpg");
                  },
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
