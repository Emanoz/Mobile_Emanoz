import 'package:agenda_estudante/database/dao/disciplina_dao.dart';
import 'package:agenda_estudante/database/dao/tarefa_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'agenda.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(DisciplinaDao.createTable);
      db.execute(TarefaDao.createTable);
    },
    onConfigure: (db) {
      db.execute('PRAGMA foreign_keys = ON');
    },
    version: 5,
  );
}
