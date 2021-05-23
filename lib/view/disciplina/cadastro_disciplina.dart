import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/components/default_text_field.dart';
import 'package:agenda_estudante/controller/date_time_controller.dart';
import 'package:agenda_estudante/controller/disciplina_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroDisciplina extends StatefulWidget {
  @override
  _CadastroDisciplinaState createState() => _CadastroDisciplinaState();
}

class _CadastroDisciplinaState extends State<CadastroDisciplina> {
  final DateTimeController dateTimeController = DateTimeController();
  final DisciplinaController disciplinaController = DisciplinaController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Nova Disciplina',
      hasFab: false,
      fabActions: [
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              await disciplinaController.insert();
              Navigator.pop(context);
              return;
            }),
      ],
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          children: [
            Column(
              children: [
                DefaultTextField(
                  labelText: 'Disciplina',
                  hintText: 'Cálculo III',
                  controller: disciplinaController.titulo,
                ),
                Observer(
                  builder: (context) => DefaultTextField(
                    labelText: 'Período',
                    hintText: '',
                    onTap: () async {
                      await dateTimeController.dateTimeSelection(context);
                      disciplinaController.periodo.text =
                          dateTimeController.datetime.toString();
                    },
                    maxLength: 23,
                    controller: disciplinaController.periodo,
                  ),
                ),
                DefaultTextField(
                    labelText: 'Professor',
                    hintText: 'Lucas Silva',
                    controller: disciplinaController.professor),
                DefaultTextField(
                  labelText: 'Descrição',
                  controller: disciplinaController.descricao,
                  hintText: '',
                  maxLength: 200,
                  maxLines: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
