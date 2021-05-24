import 'package:agenda_estudante/database/app_database.dart';
import 'package:agenda_estudante/model/arquivo.dart';
import 'package:sqflite/sqflite.dart';

class ArquivoDao {
  static const String createTable =
      ''' CREATE TABLE arquivo (id_arquivo INTEGER PRIMARY KEY,
                      arquivo TEXT,
                      id_tarefa INTEGER,
                      FOREIGN KEY (id_tarefa)
                      REFERENCES tarefa (id_tarefa)
                        ON UPDATE CASCADE
                        ON DELETE CASCADE);''';

  Future<List<Arquivo>> findAllByTarefaID(int idTarefa) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db
        .query('arquivo', where: "id_tarefa = ?", whereArgs: [idTarefa]);
    List<Arquivo> arquivos = _toList(result);
    return arquivos;
  }

  Future<int> insert(Arquivo arquivo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> arquivoMap = _toMap(arquivo);
    return await db.insert('arquivo', arquivoMap);
  }

  Future<int> update(Arquivo arquivo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> arquivoMap = _toMap(arquivo);
    return db.update('arquivo', arquivoMap,
        where: 'id_arquivo = ?', whereArgs: [arquivo.idArquivo]);
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete('arquivo', where: 'id_arquivo = ?', whereArgs: [id]);
  }

  Map<String, dynamic> _toMap(Arquivo arquivo) {
    final Map<String, dynamic> arquivoMap = Map();
    arquivoMap['id_arquivo'] = arquivo.idArquivo;
    arquivoMap['arquivo'] = arquivo.imagem;
    arquivoMap['id_tarefa'] = arquivo.idTarefa;

    return arquivoMap;
  }

  List<Arquivo> _toList(List<Map<String, dynamic>> result) {
    final List<Arquivo> arquivos = [];
    for (Map<String, dynamic> row in result) {
      final Arquivo arquivo = Arquivo(
        row['id_arquivo'],
        row['arquivo'],
        row['id_tarefa'],
      );
      arquivos.add(arquivo);
    }
    return arquivos;
  }
}
