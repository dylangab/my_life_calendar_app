import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/app/app.router.dart';
import 'package:my_life_calendar_app/models/life_calendar_model.dart';
import 'package:my_life_calendar_app/models/user_model.dart';
import 'package:my_life_calendar_app/services/calendar_service_service.dart';
import 'package:my_life_calendar_app/services/hive_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LifeCalendarViewModel extends BaseViewModel {
  LifeCalendarModel? lifeCalendarModel;
  int? totalWeeks;
  UserProfile? userProfile;
  final _calendarApi = locator<CalendarServiceService>();
  final _hiveApi = locator<HiveApiService>();
  final _navigation = locator<NavigationService>();
  ValueNotifier<double> lifeProgress = ValueNotifier<double>(0);
  ValueNotifier<double> weeksLeft = ValueNotifier<double>(0);

  void getCalendar(DateTime birthdate, int lifeExpectancy) {
    lifeCalendarModel =
        _calendarApi.generateCalendar(birthdate, lifeExpectancy);
  }

  void navigateBack() {
    _navigation.navigateToLifeMapView();
  }

  void getUserProfile() async {
    userProfile = _hiveApi.fetchUserData();
    getCalendar(userProfile!.birthdate, userProfile!.lifeExpectancy!);

    showLifeProgress(userProfile!.birthdate, userProfile!.lifeExpectancy!);
    showWeeksLift(userProfile!.birthdate, userProfile!.lifeExpectancy!);
    showTotalWeeks(userProfile!.lifeExpectancy!);
  }

  void showLifeProgress(DateTime birthdate, int lifeExpectancy) {
    lifeProgress.value =
        _calendarApi.getLifeProgress(lifeExpectancy, birthdate);
  }

  Color? getColor(int yearNumber, bool isLIved) {
    if (yearNumber <= 2 && isLIved) {
      return Colors.pink[200];
    } else if (yearNumber <= 5 && isLIved) {
      return Colors.blueAccent;
    } else if (yearNumber <= 12 && isLIved) {
      return Colors.greenAccent;
    } else if (yearNumber <= 18 && isLIved) {
      return Colors.yellowAccent;
    } else if (yearNumber <= 29 && isLIved) {
      return Colors.orange;
    } else if (yearNumber <= 39 && isLIved) {
      return Colors.blue;
    } else if (yearNumber <= 59 && isLIved) {
      return Colors.purpleAccent;
    } else if (yearNumber <= 79 && isLIved) {
      return Colors.blueGrey[400];
    } else if (yearNumber > 80 && isLIved) {
      return Colors.blueGrey;
    } else {
      return Colors.grey;
    }
  }

  void showWeeksLift(DateTime birthdate, int lifeExpectancy) {
    weeksLeft.value =
        _calendarApi.getWeeksLeft(lifeExpectancy, birthdate).toDouble();
  }

  int showTotalWeeks(int lifeExpectancy) {
    int totalWeeks = _calendarApi.getTotalWeeks(lifeExpectancy);
    return totalWeeks;
  }

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
