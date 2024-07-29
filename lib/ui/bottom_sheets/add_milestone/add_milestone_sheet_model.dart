import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/services/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddMilestoneSheetModel extends BaseViewModel {
  DateTime? selectedDay;
  final _hiveApi = locator<HiveService>();
  final _navigation = locator<NavigationService>();

  void showSelectedDate(DateTime date) {
    selectedDay = date;
    rebuildUi();
  }

  Future addMilestone(
      String description, String title, DateTime pickeddate) async {
    try {
      _hiveApi.addMileStone(description, title, pickeddate);
    } catch (e) {}
  }

  Future addDate(DateTime pickeddate) async {
    try {
      _hiveApi.addDates(pickeddate);
    } catch (e) {
      print(e.toString());
    }
  }

  void navigateBack() {
    _navigation.back();
  }

  Future<void> loadingButton() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 3)); // Simulating network call
    setBusy(false);
  }

  Future<void> startLoadingButton() async {
    await runBusyFuture(loadingButton());
  }
}
