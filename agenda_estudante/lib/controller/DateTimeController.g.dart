// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DateTimeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DateTimeController on _DateTimeController, Store {
  final _$datetimeAtom = Atom(name: '_DateTimeController.datetime');

  @override
  DateTime get datetime {
    _$datetimeAtom.reportRead();
    return super.datetime;
  }

  @override
  set datetime(DateTime value) {
    _$datetimeAtom.reportWrite(value, super.datetime, () {
      super.datetime = value;
    });
  }

  final _$dateTimeSelectionAsyncAction =
      AsyncAction('_DateTimeController.dateTimeSelection');

  @override
  Future<void> dateTimeSelection(BuildContext context) {
    return _$dateTimeSelectionAsyncAction
        .run(() => super.dateTimeSelection(context));
  }

  @override
  String toString() {
    return '''
datetime: ${datetime}
    ''';
  }
}
