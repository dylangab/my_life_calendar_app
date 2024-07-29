import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PickBirthDateDialogModel extends BaseViewModel {
  DateTime? pickedDate = DateTime.now();

  void onChangedForDatePicker(DateTime date) {
    pickedDate = date;
    rebuildUi();
  }

  void savePickedDate(Function(DialogResponse) completer) {
    completer(DialogResponse(
      data: pickedDate,
    ));
    rebuildUi();
  }
}
