import 'dart:io';

import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/components/default_text_field.dart';
import 'package:agenda_estudante/controller/date_time_controller.dart';
import 'package:agenda_estudante/controller/disciplina_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

class CadastroDisciplina extends StatefulWidget {
  final DateTimeController dateTimeController = DateTimeController();
  final DisciplinaController disciplinaController;

  CadastroDisciplina(this.disciplinaController);

  @override
  _CadastroDisciplinaState createState() => _CadastroDisciplinaState();
}

class _CadastroDisciplinaState extends State<CadastroDisciplina> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Nova Disciplina',
      hasFab: false,
      fabActions: [
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              await widget.disciplinaController.insert();
              Navigator.pop(context);
              return;
            }),
      ],
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          children: [
            Column(
              children: [
                DefaultTextField(
                  labelText: 'Disciplina',
                  hintText: 'Cálculo III',
                  controller: widget.disciplinaController.titulo,
                ),
                Observer(
                  builder: (context) => DefaultTextField(
                    labelText: 'Período',
                    hintText: '',
                    onTap: () async {
                      await widget.dateTimeController
                          .dateTimeSelection(context);
                      widget.disciplinaController.periodo.text =
                          widget.dateTimeController.datetime.toString();
                    },
                    maxLength: 23,
                    controller: widget.disciplinaController.periodo,
                  ),
                ),
                DefaultTextField(
                    labelText: 'Professor',
                    hintText: 'Lucas Silva',
                    controller: widget.disciplinaController.professor),
                DefaultTextField(
                  labelText: 'Descrição',
                  controller: widget.disciplinaController.descricao,
                  hintText: '',
                  maxLength: 200,
                  maxLines: 7,
                ),
                TextButton(
                  onPressed: () async {
                    widget.disciplinaController.updateImagem(await ImagePicker()
                        .getImage(
                            source: ImageSource.gallery, imageQuality: 50));
                  },
                  child: Text(
                    "Selecionar imagem",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Observer(
                  builder: (context) {
                    return Container(
                      margin: EdgeInsets.all(16.0),
                      child: Image.file(
                        File(widget.disciplinaController.imagem.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                              "https://cdn.neemo.com.br/uploads/settings_webdelivery/logo/3136/image-not-found.jpg");
                        },
                      ),
                      height: 150,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
