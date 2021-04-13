import 'package:mobx/mobx.dart';

part 'DropDownController.g.dart';

class DropDownController = _DropDownController with _$DropDownController;

abstract class _DropDownController with Store {
  @observable
  String value = 'PENDENTE';

  @action
  void onChanged(String newValue) {
    value = newValue;
  }
}
