import 'package:agenda_estudante/components/DefaultScaffold.dart';
import 'package:agenda_estudante/components/DefaultTextField.dart';
import 'package:agenda_estudante/controller/DateTimeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroDisciplina extends StatefulWidget {
  @override
  _CadastroDisciplinaState createState() => _CadastroDisciplinaState();
}

class _CadastroDisciplinaState extends State<CadastroDisciplina> {
  DateTimeController disciplinaController = DateTimeController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Nova Disciplina',
      hasFab: false,
      fabActions: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          children: [
            Column(
              children: [
                DefaultTextField(
                    labelText: 'Disciplina', hintText: 'Cálculo III'),
                Observer(
                  builder: (context) => DefaultTextField(
                    labelText: 'Período',
                    hintText: '',
                    onTap: () async {
                      await disciplinaController.dateTimeSelection(context);
                      disciplinaController.datetimeController.text =
                          disciplinaController.datetime.toString();
                    },
                    maxLength: 23,
                    controller: disciplinaController.datetimeController,
                  ),
                ),
                DefaultTextField(
                    labelText: 'Professor', hintText: 'Lucas Silva'),
                DefaultTextField(
                  labelText: 'Descrição',
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
