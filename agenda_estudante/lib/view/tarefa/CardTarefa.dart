import 'package:agenda_estudante/components/DefaultScaffold.dart';
import 'package:agenda_estudante/model/Tarefa.dart';
import 'package:agenda_estudante/view/tarefa/CadastroTarefa.dart';
import 'package:agenda_estudante/view/tarefa/CardTarefaItem.dart';
import 'package:flutter/material.dart';
import 'package:agenda_estudante/enums/Status.dart';

class CardTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exemplo de tarefa PENDENTE
    Tarefa tarefa1 = Tarefa(
        titulo: 'AC1 - Relatório dobre Microcontroladores',
        descricao: 'Terminar a introdução e executar a simulação pelo Proteus',
        status: Status.PENDENTE);
    // Exemplo de tarefa CONCLUÍDA
    Tarefa tarefa2 = Tarefa(
        titulo: 'AC1 - Relatório dobre Microcontroladores',
        descricao: 'Terminar a introdução e executar a simulação pelo Proteus',
        status: Status.CONCLUIDO);

    return DefaultScaffold(
      appBarTitle: 'Cálculo',
      fabNavigation: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => CadastroTarefa())),
      fabIcon: Icon(
        Icons.add,
        size: 50,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // Exemplos de tarefas que serão mostradas após o back ser implementado
              CardTarefaItem(tarefa1),
              CardTarefaItem(tarefa1),
              CardTarefaItem(tarefa2),
              CardTarefaItem(tarefa2),
              CardTarefaItem(tarefa1),
            ],
          )
        ],
      ),
    );
  }
}
