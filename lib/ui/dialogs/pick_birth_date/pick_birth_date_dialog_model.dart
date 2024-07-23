import 'package:stacked/stacked.dart';

class PickBirthDateDialogModel extends BaseViewModel {
  DateTime? pickedDate = DateTime.now();

  void onChangedForDatePicker(DateTime date) {
    pickedDate = date;
    rebuildUi();
  }
}
