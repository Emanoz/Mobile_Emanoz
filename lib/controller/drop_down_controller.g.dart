// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_down_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DropDownController on _DropDownController, Store {
  final _$valueAtom = Atom(name: '_DropDownController.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_DropDownControllerActionController =
      ActionController(name: '_DropDownController');

  @override
  void onChanged(String newValue) {
    final _$actionInfo = _$_DropDownControllerActionController.startAction(
        name: '_DropDownController.onChanged');
    try {
      return super.onChanged(newValue);
    } finally {
      _$_DropDownControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
