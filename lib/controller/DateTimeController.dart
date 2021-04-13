import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'DateTimeController.g.dart';

class DateTimeController = _DateTimeController with _$DateTimeController;

abstract class _DateTimeController with Store {
  TextEditingController datetimeController = TextEditingController();

  @observable
  DateTime datetime = DateTime.now();

  @action
  Future<void> dateTimeSelection(BuildContext context) async {
    datetime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(3000),
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
    );
  }
}
