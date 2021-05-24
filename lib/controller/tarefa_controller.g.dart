// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TarefaController on _TarefaController, Store {
  final _$listTarefaAtom = Atom(name: '_TarefaController.listTarefa');

  @override
  ObservableList<Tarefa> get listTarefa {
    _$listTarefaAtom.reportRead();
    return super.listTarefa;
  }

  @override
  set listTarefa(ObservableList<Tarefa> value) {
    _$listTarefaAtom.reportWrite(value, super.listTarefa, () {
      super.listTarefa = value;
    });
  }

  final _$statusValueAtom = Atom(name: '_TarefaController.statusValue');

  @override
  String get statusValue {
    _$statusValueAtom.reportRead();
    return super.statusValue;
  }

  @override
  set statusValue(String value) {
    _$statusValueAtom.reportWrite(value, super.statusValue, () {
      super.statusValue = value;
    });
  }

  final _$findAllByDisciplinaAsyncAction =
      AsyncAction('_TarefaController.findAllByDisciplina');

  @override
  Future<void> findAllByDisciplina(int idDisciplina) {
    return _$findAllByDisciplinaAsyncAction
        .run(() => super.findAllByDisciplina(idDisciplina));
  }

  final _$insertAsyncAction = AsyncAction('_TarefaController.insert');

  @override
  Future<int> insert() {
    return _$insertAsyncAction.run(() => super.insert());
  }

  final _$deleteAsyncAction = AsyncAction('_TarefaController.delete');

  @override
  Future<int> delete(Tarefa tarefa) {
    return _$deleteAsyncAction.run(() => super.delete(tarefa));
  }

  final _$updateAsyncAction = AsyncAction('_TarefaController.update');

  @override
  Future<int> update(Tarefa tarefa) {
    return _$updateAsyncAction.run(() => super.update(tarefa));
  }

  final _$updateStatusAsyncAction =
      AsyncAction('_TarefaController.updateStatus');

  @override
  Future<int> updateStatus(Tarefa tarefa) {
    return _$updateStatusAsyncAction.run(() => super.updateStatus(tarefa));
  }

  @override
  String toString() {
    return '''
listTarefa: ${listTarefa},
statusValue: ${statusValue}
    ''';
  }
}
