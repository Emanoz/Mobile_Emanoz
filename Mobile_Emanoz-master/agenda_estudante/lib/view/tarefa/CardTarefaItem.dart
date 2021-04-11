import 'package:agenda_estudante/enums/Status.dart';
import 'package:agenda_estudante/model/Tarefa.dart';
import 'package:agenda_estudante/view/tarefa/CardTarefa.dart';
import 'package:agenda_estudante/view/tarefa/CardTarefaAnexo.dart';
import 'package:flutter/material.dart';

class CardTarefaItem extends StatelessWidget {
  final Tarefa tarefa;

  CardTarefaItem(this.tarefa);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: tarefa.status == Status.PENDENTE
                ? Icon(
                    Icons.pending_actions,
                    color: Colors.black,
                    size: 30,
                  )
                : Icon(
                    Icons.done,
                    color: Colors.black,
                    size: 30,
                  ),
            title: Text(tarefa.titulo),
            subtitle: Text(tarefa.descricao),
            minVerticalPadding: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardTarefaAnexo())),
                child: Text(
                  'VISUALIZAR ANEXOS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'FEITO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'EXCLUIR',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
