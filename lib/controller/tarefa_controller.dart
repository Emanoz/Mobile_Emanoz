import 'package:agenda_estudante/database/dao/tarefa_dao.dart';
import 'package:agenda_estudante/model/tarefa.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'tarefa_controller.g.dart';

class TarefaController = _TarefaController with _$TarefaController;

abstract class _TarefaController with Store {
  TextEditingController titulo = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController prazo = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController idDisciplina = TextEditingController();

  final TarefaDao dao = TarefaDao();

  @observable
  ObservableList<Tarefa> listTarefa = ObservableList();

  @observable
  String statusValue = "PENDENTE";

  @action
  Future<void> findAllByDisciplina(int idDisciplina) async {
    List<Tarefa> list = await dao.findAllByDisciplinaID(idDisciplina);
    list.forEach((element) {
      listTarefa.add(element);
    });
  }

  @action
  Future<int> insert() async {
    String statusConverted;
    switch (status.text) {
      case 'Status.PENDENTE':
        statusConverted = 'PENDENTE';
        break;
      case 'Status.CONCLUIDO':
        statusConverted = 'CONCLUIDO';
        break;
      default:
        statusConverted = 'PENDENTE';
        break;
    }

    Tarefa tarefa = Tarefa(null, titulo.text, statusConverted, prazo.text,
        descricao.text, int.tryParse(idDisciplina.text));
    int result = await dao.insert(tarefa);
    await findAllByDisciplina(tarefa.idDisciplina);
    return result;
  }

  @action
  Future<int> delete(Tarefa tarefa) async {
    int result = await dao.delete(tarefa.idTarefa);
    await findAllByDisciplina(tarefa.idDisciplina);
    return result;
  }

  @action
  Future<int> update(Tarefa tarefa) async {
    int result = await dao.update(tarefa);
    await findAllByDisciplina(tarefa.idDisciplina);
    return result;
  }

  @action
  Future<int> updateStatus(Tarefa tarefa) async {
    statusValue = tarefa.status;
    int result = await update(tarefa);
    return result;
  }
}
