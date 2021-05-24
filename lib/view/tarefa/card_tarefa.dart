import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/controller/tarefa_controller.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:agenda_estudante/model/tarefa.dart';
import 'package:agenda_estudante/view/tarefa/cadastro_tarefa.dart';
import 'package:agenda_estudante/view/tarefa/card_tarefa_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardTarefa extends StatefulWidget {
  final Disciplina disciplina;
  final TarefaController controller = TarefaController();

  CardTarefa(this.disciplina);

  @override
  _CardTarefaState createState() => _CardTarefaState();
}

class _CardTarefaState extends State<CardTarefa> {
  @override
  void initState() {
    super.initState();
    widget.controller.findAllByDisciplina(widget.disciplina.idDisciplina);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: widget.disciplina.titulo,
      fabNavigation: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CadastroTarefa(widget.disciplina.idDisciplina))),
      fabIcon: Icon(
        Icons.add,
        size: 50,
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: widget.controller.listTarefa.length,
            itemBuilder: (_, index) {
              Tarefa tarefa = widget.controller.listTarefa[index];
              return CardTarefaItem(tarefa);
            },
          );
        },
      ),
    );
  }
}
