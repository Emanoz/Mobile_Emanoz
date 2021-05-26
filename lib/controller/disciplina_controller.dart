import 'package:agenda_estudante/database/dao/disciplina_dao.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'disciplina_controller.g.dart';

class DisciplinaController = _DisciplinaController with _$DisciplinaController;

abstract class _DisciplinaController with Store {
  final DisciplinaDao dao = DisciplinaDao();
  TextEditingController titulo = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController professor = TextEditingController();
  TextEditingController descricao = TextEditingController();

  @observable
  PickedFile imagem = PickedFile("");

  @observable
  ObservableList<Disciplina> listDisciplina = ObservableList();

  @action
  void updateImagem(PickedFile imagemNova) {
    imagem = imagemNova;
  }

  @action
  Future<void> findAll() async {
    List<Disciplina> list = await dao.findAll();
    listDisciplina = ObservableList.of(list);
  }

  @action
  Future<int> insert() async {
    Disciplina disciplina = Disciplina(null, titulo.text, periodo.text,
        professor.text, descricao.text, imagem.path);
    int result = await dao.insert(disciplina);
    await findAll();
    return result;
  }
}
