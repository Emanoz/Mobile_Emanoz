import 'dart:io';

import 'package:agenda_estudante/database/dao/arquivo_dao.dart';
import 'package:agenda_estudante/model/arquivo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'arquivo_controller.g.dart';

class ArquivoController = _ArquivoController with _$ArquivoController;

abstract class _ArquivoController with Store {
  int idTarefa = 0;
  int idArquivo = 0;

  final ArquivoDao dao = ArquivoDao();

  PickedFile imagem;

  @observable
  ObservableList<Arquivo> listArquivos = ObservableList();

  @action
  Future<void> findAllByTarefa(int idTarefa) async {
    listArquivos.clear();
    listArquivos.addAll(await dao.findAllByTarefaID(idTarefa));
  }

  @action
  Future<int> insert() async {
    Arquivo arquivo = Arquivo(null, imagem.path, idTarefa);
    int result = await dao.insert(arquivo);
    await findAllByTarefa(arquivo.idTarefa);
    return result;
  }

  @action
  Future<int> delete(int idArquivo) async {
    int result = await dao.delete(idArquivo);
    await findAllByTarefa(idTarefa);
    return result;
  }

  @action
  Future<int> update(Arquivo arquivo) async {
    int result = await dao.update(arquivo);
    await findAllByTarefa(arquivo.idTarefa);
    return result;
  }
}
