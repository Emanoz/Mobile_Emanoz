import 'package:agenda_estudante/components/DefaultScaffold.dart';
import 'package:agenda_estudante/components/DefaultTextField.dart';
import 'package:agenda_estudante/controller/DateTimeController.dart';
import 'package:agenda_estudante/controller/DropDownController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroTarefa extends StatefulWidget {
  @override
  _CadastroTarefaState createState() => _CadastroTarefaState();
}

class _CadastroTarefaState extends State<CadastroTarefa> {
  DateTimeController datetimeController = DateTimeController();
  DropDownController dropDownController = DropDownController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Nova Tarefa',
      hasFab: false,
      fabActions: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () => Navigator.pop(context),
        )
      ],
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          children: [
            Column(
              children: [
                DefaultTextField(
                    labelText: 'Título', hintText: 'Relatório de Estatística'),
                Observer(
                  builder: (context) => DropdownButton<String>(
                    value: dropDownController.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                    ),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChanged: (String text) =>
                        dropDownController.onChanged(text),
                    items: <String>['PENDENTE', 'CONCLUÍDO']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                DefaultTextField(
                    labelText: 'Professor', hintText: 'Lucas Silva'),
                Observer(
                  builder: (context) => DefaultTextField(
                    labelText: 'Prazo',
                    hintText: '',
                    onTap: () async {
                      await datetimeController.dateTimeSelection(context);
                      datetimeController.datetimeController.text =
                          datetimeController.datetime.toString();
                    },
                    maxLength: 23,
                    controller: datetimeController.datetimeController,
                  ),
                ),
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
