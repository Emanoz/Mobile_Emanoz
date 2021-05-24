import 'package:agenda_estudante/database/app_database.dart';
import 'package:agenda_estudante/model/tarefa.dart';
import 'package:sqflite/sqflite.dart';

class TarefaDao {
  static const String createTable =
      ''' CREATE TABLE tarefa (id_tarefa INTEGER PRIMARY KEY,
                      titulo TEXT,
                      status TEXT,
                      prazo TEXT,
                      descricao TEXT,
                      id_disciplina INTEGER,
                      FOREIGN KEY (id_disciplina)
                      REFERENCES disciplina (id_disciplina)
                        ON UPDATE CASCADE
                        ON DELETE CASCADE);''';

  Future<List<Tarefa>> findAllByDisciplinaID(int idDisciplina) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db
        .query('tarefa', where: "id_disciplina = ?", whereArgs: [idDisciplina]);
    List<Tarefa> tarefas = _toList(result);
    return tarefas;
  }

  Future<int> insert(Tarefa tarefa) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tarefaMap = _toMap(tarefa);
    return await db.insert('tarefa', tarefaMap);
  }

  Future<int> update(Tarefa tarefa) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tarefaMap = _toMap(tarefa);
    return db.update('tarefa', tarefaMap,
        where: 'id_tarefa = ?', whereArgs: [tarefa.idTarefa]);
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete('tarefa', where: 'id_tarefa = ?', whereArgs: [id]);
  }

  Map<String, dynamic> _toMap(Tarefa tarefa) {
    final Map<String, dynamic> tarefaMap = Map();
    tarefaMap['id_tarefa'] = tarefa.idTarefa;
    tarefaMap['titulo'] = tarefa.titulo;
    tarefaMap['status'] = tarefa.status;
    tarefaMap['prazo'] = tarefa.prazo;
    tarefaMap['descricao'] = tarefa.descricao;
    tarefaMap['id_disciplina'] = tarefa.idDisciplina;

    return tarefaMap;
  }

  List<Tarefa> _toList(List<Map<String, dynamic>> result) {
    final List<Tarefa> tarefas = List<Tarefa>.of([]);
    for (Map<String, dynamic> row in result) {
      final Tarefa tarefa = Tarefa(
        row['id_tarefa'],
        row['titulo'],
        row['status'],
        row['prazo'],
        row['descricao'],
        row['id_disciplina'],
      );
      tarefas.add(tarefa);
    }
    return tarefas;
  }
}
