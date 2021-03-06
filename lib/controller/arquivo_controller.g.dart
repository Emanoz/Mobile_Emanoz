// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arquivo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArquivoController on _ArquivoController, Store {
  final _$listArquivosAtom = Atom(name: '_ArquivoController.listArquivos');

  @override
  ObservableList<Arquivo> get listArquivos {
    _$listArquivosAtom.reportRead();
    return super.listArquivos;
  }

  @override
  set listArquivos(ObservableList<Arquivo> value) {
    _$listArquivosAtom.reportWrite(value, super.listArquivos, () {
      super.listArquivos = value;
    });
  }

  final _$findAllByTarefaAsyncAction =
      AsyncAction('_ArquivoController.findAllByTarefa');

  @override
  Future<void> findAllByTarefa(int idTarefa) {
    return _$findAllByTarefaAsyncAction
        .run(() => super.findAllByTarefa(idTarefa));
  }

  final _$insertAsyncAction = AsyncAction('_ArquivoController.insert');

  @override
  Future<int> insert() {
    return _$insertAsyncAction.run(() => super.insert());
  }

  final _$deleteAsyncAction = AsyncAction('_ArquivoController.delete');

  @override
  Future<int> delete(int idArquivo) {
    return _$deleteAsyncAction.run(() => super.delete(idArquivo));
  }

  final _$updateAsyncAction = AsyncAction('_ArquivoController.update');

  @override
  Future<int> update(Arquivo arquivo) {
    return _$updateAsyncAction.run(() => super.update(arquivo));
  }

  @override
  String toString() {
    return '''
listArquivos: ${listArquivos}
    ''';
  }
}
