import 'package:my_life_calendar_app/app/app.dialogs.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:my_life_calendar_app/services/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateProfileViewModel extends BaseViewModel {
  // Slider value for life expectancy
  double lifeExpectancySilderValue = 0;
  final _dialogService = locator<DialogService>();
  // Service instance for Hive API
  final _hiveApi = locator<HiveApiService>();

  // Updates the slider value and rebuilds the UI
  void updateSliderValue(double value) {
    lifeExpectancySilderValue = value;
    rebuildUi();
  }

  // Selected date for the date picker
  DateTime pickeddate = DateTime.now();

  // Service instance for navigation
  final _navigate = locator<NavigationService>();

  // Updates the picked date and rebuilds the UI
  void onChangedForDatePicker(DateTime date) {
    pickeddate = date;
    rebuildUi();
  }

  // Navigates back to the previous screen
  void navigateBack() {
    _navigate.back();
  }

  // Navigates to the home page
  void goToHomePage() {
    _navigate.replaceWithHomeView();
  }

  // Creates a user profile with life expectancy and birthdate
  Future createUserProfile(int life_expectancy, DateTime birthdate) async {
    try {
      _hiveApi.create_user_data(life_expectancy, birthdate);
      print("success");
    } catch (e) {
      print(e.toString());
    }
  }

  void showpickDateDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.pickBirthDate, data: {'pickedDate': pickeddate});

    print(pickeddate.toString());
  }
}
