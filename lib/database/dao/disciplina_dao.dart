import 'package:agenda_estudante/database/app_database.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:sqflite/sqflite.dart';

class DisciplinaDao {
  static String createTable =
      '''CREATE TABLE disciplina (id_disciplina INTEGER PRIMARY KEY, 
          titulo TEXT,
          periodo TEXT,
          professor TEXT,
          descricao TEXT,
          imagem TEXT);''';

  Future<List<Disciplina>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('disciplina');
    List<Disciplina> contacts = _toList(result);
    return contacts;
  }

  Future<int> insert(Disciplina disciplina) async {
    final Database db = await getDatabase();
    Map<String, dynamic> disciplinaMap = _toMap(disciplina);
    return await db.insert('disciplina', disciplinaMap);
  }

  Future<int> update(Disciplina disciplina) async {
    final Database db = await getDatabase();
    Map<String, dynamic> disciplinaMap = _toMap(disciplina);
    return db.update('disciplina', disciplinaMap,
        where: 'id_disciplina = ?', whereArgs: [disciplina.idDisciplina]);
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete('disciplina', where: 'id_disciplina = ?', whereArgs: [id]);
  }

  Map<String, dynamic> _toMap(Disciplina disciplina) {
    final Map<String, dynamic> disciplinaMap = Map();
    disciplinaMap['id_disciplina'] = disciplina.idDisciplina;
    disciplinaMap['titulo'] = disciplina.titulo;
    disciplinaMap['periodo'] = disciplina.periodo;
    disciplinaMap['professor'] = disciplina.professor;
    disciplinaMap['descricao'] = disciplina.descricao;
    disciplinaMap['imagem'] = disciplina.imagem;

    return disciplinaMap;
  }

  List<Disciplina> _toList(List<Map<String, dynamic>> result) {
    final List<Disciplina> disciplinas = [];
    for (Map<String, dynamic> row in result) {
      final Disciplina disciplina = Disciplina(
        row['id_disciplina'],
        row['titulo'],
        row['periodo'],
        row['professor'],
        row['descricao'],
        row['imagem'],
      );
      disciplinas.add(disciplina);
    }
    return disciplinas;
  }
}
