import 'package:agenda_estudante/enums/Status.dart';

class Tarefa {
  String titulo;
  Status status;
  DateTime prazo;
  String descricao;
  String imagem;

  Tarefa({this.titulo, this.status, this.prazo, this.descricao, this.imagem});
}
