import 'dart:ffi';

import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:my_life_calendar_app/services/hive_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateProfileViewModel extends BaseViewModel {
  double lifeExpectancySilderValue = 0;
  final _hiveApi = locator<HiveApiService>();

  void updateSliderValue(double value) {
    lifeExpectancySilderValue = value;
    rebuildUi();
  }

  DateTime pickeddate = DateTime.now();
  final _navigate = locator<NavigationService>();
  void onChangedForDatePicker(DateTime date) {
    pickeddate = date;
    rebuildUi();
  }

  void navigateBack() {
    _navigate.back();
  }

  void goToHomePage() {
    _navigate.replaceWithHomeView();
  }

  Future createUserProfile(int life_expectancy, DateTime birthdate) async {
    try {
      _hiveApi.create_user_data(life_expectancy, birthdate);
      print("success");
    } catch (e) {
      print(e.toString());
    }
  }
}
