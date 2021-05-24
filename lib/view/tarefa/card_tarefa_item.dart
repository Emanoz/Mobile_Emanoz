import 'package:agenda_estudante/components/default_text_styles.dart';
import 'package:agenda_estudante/controller/tarefa_controller.dart';
import 'package:agenda_estudante/model/tarefa.dart';
import 'package:agenda_estudante/view/tarefa/card_tarefa_anexo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardTarefaItem extends StatefulWidget {
  final Tarefa tarefa;
  final TarefaController controller = TarefaController();

  CardTarefaItem(this.tarefa) {
    controller.statusValue = tarefa.status;
  }

  @override
  _CardTarefaItemState createState() => _CardTarefaItemState();
}

class _CardTarefaItemState extends State<CardTarefaItem> {
  @override
  void initState() {
    widget.controller.findAllByDisciplina(widget.tarefa.idDisciplina);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Observer(builder: (context) {
        return Column(
          children: [
            ListTile(
              leading: widget.controller.statusValue == 'PENDENTE'
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
                widget.tarefa.titulo,
                style: DefaultTextStyles.cardTitleStyle(),
              ),
              subtitle: Text(
                widget.tarefa.descricao,
                style: DefaultTextStyles.cardSubtitleStyle(),
              ),
              minVerticalPadding: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardTarefaAnexo())),
                  child: Text('VISUALIZAR ANEXOS',
                      style: DefaultTextStyles.cardButtonStyle()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        widget.tarefa.status = 'CONCLUIDO';
                        await widget.controller.updateStatus(widget.tarefa);
                      },
                      child: Text(
                        'FEITO',
                        style: DefaultTextStyles.cardButtonStyle(),
                      ),
                    ),
                    TextButton(
                      onPressed: () async =>
                          await widget.controller.delete(widget.tarefa),
                      child: Text(
                        'EXCLUIR',
                        style: DefaultTextStyles.cardButtonStyle(
                            color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
