// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disciplina_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DisciplinaController on _DisciplinaController, Store {
  final _$listDisciplinaAtom =
      Atom(name: '_DisciplinaController.listDisciplina');

  @override
  List<Disciplina> get listDisciplina {
    _$listDisciplinaAtom.reportRead();
    return super.listDisciplina;
  }

  @override
  set listDisciplina(List<Disciplina> value) {
    _$listDisciplinaAtom.reportWrite(value, super.listDisciplina, () {
      super.listDisciplina = value;
    });
  }

  final _$findAllAsyncAction = AsyncAction('_DisciplinaController.findAll');

  @override
  Future<List<Disciplina>> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  final _$insertAsyncAction = AsyncAction('_DisciplinaController.insert');

  @override
  Future<int> insert() {
    return _$insertAsyncAction.run(() => super.insert());
  }

  @override
  String toString() {
    return '''
listDisciplina: ${listDisciplina}
    ''';
  }
}