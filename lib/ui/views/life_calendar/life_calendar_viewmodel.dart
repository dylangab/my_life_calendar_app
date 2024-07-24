import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:my_life_calendar_app/models/life_calendar_model.dart';
import 'package:my_life_calendar_app/models/user_model.dart';
import 'package:my_life_calendar_app/services/calendar_service.dart';
import 'package:my_life_calendar_app/services/hive_service.dart';
import 'package:my_life_calendar_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LifeCalendarViewModel extends BaseViewModel {
  // Life calendar model
  LifeCalendarModel? lifeCalendarModel;

  // Total weeks in the life calendar
  int? totalWeeks;

  // User profile information
  UserProfile? userProfile;

  // Service instances
  final _calendarApi = locator<CalendarServiceService>();
  final _hiveApi = locator<HiveApiService>();
  final _navigation = locator<NavigationService>();

  // Value notifiers for life progress and weeks left
  ValueNotifier<double> lifeProgress = ValueNotifier<double>(0);
  ValueNotifier<double> weeksLeft = ValueNotifier<double>(0);

  // Generates the life calendar based on user's birthdate and life expectancy
  void getCalendar(DateTime birthdate, int lifeExpectancy) {
    lifeCalendarModel =
        _calendarApi.generateCalendar(birthdate, lifeExpectancy);
  }

  // Navigates back to the Life Map view
  void navigateBack() {
    _navigation.navigateToLifeMapView();
  }

  // Fetches the user profile and initializes the calendar, life progress, and weeks left
  void getUserProfile() async {
    userProfile = _hiveApi.fetchUserData();
    getCalendar(userProfile!.birthdate, userProfile!.lifeExpectancy!);
    showLifeProgress(userProfile!.birthdate, userProfile!.lifeExpectancy!);
    showWeeksLift(userProfile!.birthdate, userProfile!.lifeExpectancy!);
    showTotalWeeks(userProfile!.lifeExpectancy!);
  }

  // Calculates and updates the life progress
  void showLifeProgress(DateTime birthdate, int lifeExpectancy) {
    lifeProgress.value =
        _calendarApi.getLifeProgress(lifeExpectancy, birthdate);
  }

  // Determines the color based on the year number and whether the year is lived
  Color? getColor(int yearNumber, bool isLIved) {
    if (yearNumber <= 2 && isLIved) {
      return kcPurpleLight;
    } else if (yearNumber <= 5 && isLIved) {
      return kcBlueLight;
    } else if (yearNumber <= 12 && isLIved) {
      return kcGreen;
    } else if (yearNumber <= 18 && isLIved) {
      return kcYellow;
    } else if (yearNumber <= 29 && isLIved) {
      return kcOrange;
    } else if (yearNumber <= 39 && isLIved) {
      return kcBlue;
    } else if (yearNumber <= 59 && isLIved) {
      return kcPurple;
    } else if (yearNumber <= 79 && isLIved) {
      return kcBlueGrey;
    } else if (yearNumber > 80 && isLIved) {
      return kcGrey;
    } else {
      return kcGrey;
    }
  }

  // Calculates and updates the weeks left
  void showWeeksLift(DateTime birthdate, int lifeExpectancy) {
    weeksLeft.value =
        _calendarApi.getWeeksLeft(lifeExpectancy, birthdate).toDouble();
  }

  // Calculates and returns the total weeks in the life calendar
  int showTotalWeeks(int lifeExpectancy) {
    int totalWeeks = _calendarApi.getTotalWeeks(lifeExpectancy);
    return totalWeeks;
  }

  // Returns a greeting message based on the current time of day
  String getGreetingMessage() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
