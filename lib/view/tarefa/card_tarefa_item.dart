import 'package:agenda_estudante/components/default_text_styles.dart';
import 'package:agenda_estudante/enums/status.dart';
import 'package:agenda_estudante/model/tarefa.dart';
import 'package:agenda_estudante/view/tarefa/card_tarefa_anexo.dart';
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
            title: Text(
              tarefa.titulo,
              style: DefaultTextStyles.cardTitleStyle(),
            ),
            subtitle: Text(
              tarefa.descricao,
              style: DefaultTextStyles.cardSubtitleStyle(),
            ),
            minVerticalPadding: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardTarefaAnexo())),
                child: Text('VISUALIZAR ANEXOS',
                    style: DefaultTextStyles.cardButtonStyle()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'FEITO',
                      style: DefaultTextStyles.cardButtonStyle(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'EXCLUIR',
                      style:
                          DefaultTextStyles.cardButtonStyle(color: Colors.red),
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
