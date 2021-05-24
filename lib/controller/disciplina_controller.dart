import 'package:agenda_estudante/database/dao/disciplina_dao.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'disciplina_controller.g.dart';

class DisciplinaController = _DisciplinaController with _$DisciplinaController;

abstract class _DisciplinaController with Store {
  TextEditingController titulo = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController professor = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController imagem = TextEditingController();

  final DisciplinaDao dao = DisciplinaDao();

  @observable
  ObservableList<Disciplina> listDisciplina = ObservableList();

  @action
  Future<void> findAll() async {
    List<Disciplina> list = await dao.findAll();
    listDisciplina = ObservableList.of(list);
  }

  @action
  Future<int> insert() async {
    Disciplina disciplina = Disciplina(null, titulo.text, periodo.text,
        professor.text, descricao.text, imagem.text);
    int result = await dao.insert(disciplina);
    await findAll();
    return result;
  }
}
