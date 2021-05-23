import 'package:agenda_estudante/enums/status.dart';
import 'package:agenda_estudante/model/arquivo.dart';

class Tarefa {
  int idTarefa;
  String titulo;
  Status status;
  DateTime prazo;
  String descricao;
  List<Arquivo> arquivo;
  int idDisciplina;

  Tarefa(
      {this.idTarefa,
      this.titulo,
      this.status,
      this.prazo,
      this.descricao,
      this.arquivo,
      this.idDisciplina});
}
