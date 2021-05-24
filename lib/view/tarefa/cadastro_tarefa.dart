import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/components/default_text_field.dart';
import 'package:agenda_estudante/controller/date_time_controller.dart';
import 'package:agenda_estudante/controller/drop_down_controller.dart';
import 'package:agenda_estudante/controller/tarefa_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroTarefa extends StatefulWidget {
  final DateTimeController datetimeController = DateTimeController();
  final DropDownController dropDownController = DropDownController();
  final TarefaController tarefaController = TarefaController();

  CadastroTarefa(int idDisciplina) {
    this.tarefaController.idDisciplina.text = idDisciplina.toString();
  }

  @override
  _CadastroTarefaState createState() => _CadastroTarefaState();
}

class _CadastroTarefaState extends State<CadastroTarefa> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Nova Tarefa',
      hasFab: false,
      fabActions: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () async {
            await widget.tarefaController.insert();
            Navigator.pop(context);
          },
        )
      ],
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          children: [
            Column(
              children: [
                DefaultTextField(
                  labelText: 'Título',
                  hintText: 'Relatório de Estatística',
                  controller: widget.tarefaController.titulo,
                ),
                Observer(
                  builder: (context) => DropdownButton<String>(
                    value: widget.dropDownController.value,
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
                        widget.dropDownController.onChanged(text),
                    items: <String>['PENDENTE', 'CONCLUÍDO']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Observer(
                  builder: (context) => DefaultTextField(
                    labelText: 'Prazo',
                    hintText: '',
                    controller: widget.tarefaController.prazo,
                    onTap: () async {
                      await widget.datetimeController
                          .dateTimeSelection(context);
                      widget.tarefaController.prazo.text =
                          widget.datetimeController.datetime.toString();
                    },
                    maxLength: 23,
                  ),
                ),
                DefaultTextField(
                  labelText: 'Descrição',
                  hintText: '',
                  controller: widget.tarefaController.descricao,
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
