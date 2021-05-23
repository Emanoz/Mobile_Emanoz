import 'package:agenda_estudante/components/default_text_styles.dart';
import 'package:flutter/material.dart';

import '../../components/default_scaffold.dart';

class CardTarefaAnexo extends StatefulWidget {
  @override
  _CardTarefaAnexoState createState() => _CardTarefaAnexoState();
}

class _CardTarefaAnexoState extends State<CardTarefaAnexo> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Anexos',
      hasFab: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            _item(context),
            _item(context),
            _item(context),
            _item(context),
            _item(context),
            _item(context),
            _item(context),
            _item(context),
          ],
        ),
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

Widget _item(BuildContext context) {
  return Container(
    child: GestureDetector(
      onTap: () async => await _showAlertDialog(context),
      child: Image.asset(
        'assets/cao.jpg',
        //semanticLabel: disciplina.titulo,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
  );
}
