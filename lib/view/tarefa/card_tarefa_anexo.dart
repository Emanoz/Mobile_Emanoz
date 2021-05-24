import 'dart:io';
import 'package:agenda_estudante/components/default_text_styles.dart';
import 'package:agenda_estudante/controller/arquivo_controller.dart';
import 'package:agenda_estudante/model/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/default_scaffold.dart';

final ArquivoController controller = ArquivoController();

class CardTarefaAnexo extends StatefulWidget {
  final Tarefa tarefa;

  CardTarefaAnexo(this.tarefa) {
    controller.idTarefa = tarefa.idTarefa;
  }

  @override
  _CardTarefaAnexoState createState() => _CardTarefaAnexoState();
}

class _CardTarefaAnexoState extends State<CardTarefaAnexo> {
  @override
  void initState() {
    controller.findAllByTarefa(widget.tarefa.idTarefa);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Anexos',
      hasFab: true,
      fabNavigation: () async {
        controller.imagem = await ImagePicker.pickImage(
            source: ImageSource.gallery, imageQuality: 50);
        await controller.insert();
      },
      fabIcon: Icon(
        Icons.add,
        size: 50,
      ),
      body: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(controller.listArquivos.length, (index) {
                return _item(
                    context, File(controller.listArquivos[index].imagem));
              }),
            ),
          );
        },
      ),
    );
  }
}

Future<Widget> _showAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 5,
        titleTextStyle:
            DefaultTextStyles.popUpStyle(color: Colors.red, isBold: true),
        contentTextStyle: DefaultTextStyles.popUpStyle(color: Colors.black),
        title: Center(
          child: Text('Aviso!'),
        ),
        content: Text('Têm certeza que deseja excluir esse anexo?'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'CANCELAR',
              style: DefaultTextStyles.popUpStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'DOWNLOAD',
              style: DefaultTextStyles.popUpStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'EXCLUIR',
              style: DefaultTextStyles.popUpStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

Widget _item(BuildContext context, File imagem) {
  return Container(
      child: GestureDetector(
    onTap: () async => await _showAlertDialog(context),
    child: Image.file(
      imagem,
      //semanticLabel: disciplina.titulo,
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ));
}
