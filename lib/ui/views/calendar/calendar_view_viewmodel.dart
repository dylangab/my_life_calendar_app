import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:my_life_calendar_app/app/app.bottomsheets.dart';
import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/models/day_model.dart';
import 'package:my_life_calendar_app/models/life_calendar_model.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/models/user_model.dart';
import 'package:my_life_calendar_app/services/calendar_service.dart';
import 'package:my_life_calendar_app/services/hive_service.dart';
import 'package:my_life_calendar_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CalendarViewViewModel extends BaseViewModel {
  // Service instances
  final _hiveApi = locator<HiveService>();
  final _navigation = locator<NavigationService>();
  final dialog_service = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _calendarApi = locator<CalendarServiceService>();
  final navigationService = locator<NavigationService>();

  // Milestone list and selected milestone
  List<Milestone?>? milestoneList = [];
  Milestone? milestone;

  // Date picker variables
  DateTime pickeddate = DateTime.now();
  DateTime? pickedDate;

  // Scroll controller for handling scroll events
  ScrollController scrollController = ScrollController();

  // Calendar and user profile data
  LifeCalendarModel? calendar;
  int? selectedweek = 1;
  int? selectedyear = 1;
  UserProfile? userProfile;

  // Hive box for storing user milestones
  var userMileStone = Hive.box<Milestone>('user_milestone');

  // Generates the life calendar based on user's birthdate and life expectancy
  void getCalendar(DateTime birthdate, int lifeExpectancy) {
    calendar = _calendarApi.generateCalendar(birthdate, lifeExpectancy);
  }

  // Fetches the user profile and initializes the calendar and milestones
  void getUserProfile() async {
    userProfile = _hiveApi.fetchUserData();
    getCalendar(userProfile!.birthdate, userProfile!.lifeExpectancy!);
    milestoneWithinWeeks(
        calendar!.years[selectedyear!].weeks[selectedweek!].days);
  }

  // Displays the bottom sheet for adding a milestone
  void showBottomSheet(DateTime pickedDate) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addMilestone,
      title: "ksHomeBottomSheetTitle",
      description: "ksHomeBottomSheetDescription",
      data: {
        'packedDate': pickedDate,
      },
    );
  }

  // Adds a milestone to the Hive database
  Future addMilestone(
      String description, String title, DateTime pickeddate) async {
    try {
      _hiveApi.addMileStone(description, title, pickeddate);
      print("ok");
    } catch (e) {
      print(e.toString());
    }
  }

  // Adds a date to the Hive database
  Future addDate(DateTime pickeddate) async {
    try {
      _hiveApi.addDates(pickeddate);
      print("ok");
    } catch (e) {
      print(e.toString());
    }
  }

  // Updates the picked date and rebuilds the UI
  void onChangedForDatePicker(DateTime date) {
    pickeddate = date;
    rebuildUi();
  }

  // Navigates back to the previous screen
  void navigateBack() {
    _navigation.back();
  }

  // Updates the selected year and refreshes the milestones for that year
  void getPickedYear(int value) {
    if (value >= 0 && value < calendar!.years.length) {
      selectedyear = value;
      rebuildUi();
      milestoneWithinWeeks(
          calendar!.years[selectedyear!].weeks[selectedweek!].days);
    }
  }

  // Updates the selected week and refreshes the milestones for that week
  void getPickedWeek(int value) {
    if (selectedyear != null &&
        value >= 0 &&
        value < calendar!.years[selectedyear!].weeks.length) {
      selectedweek = value;
      rebuildUi();
      milestoneWithinWeeks(
          calendar!.years[selectedyear!].weeks[selectedweek!].days);
    }
  }

  // Saves the picked date and rebuilds the UI
  void savePickedDate(DateTime date) {
    pickedDate = date;
    rebuildUi();
  }

  // Retrieves milestones within the specified days list
  void milestoneWithinWeeks(List<DayModel> daysList) {
    milestoneList!.clear();
    for (var day in daysList) {
      if (userMileStone.get(day.date.toString()) != null) {
        milestoneList!.add(userMileStone.get(day.date.toString()));
      }
    }
  }

  String getFormatedMonth(int selectedDay) {
    return formatToMonth(calendar!
        .years[selectedyear!].weeks[selectedweek!].days[selectedDay].date!);
  }

  String getFormatedDay(int selectedDay) {
    return formatToDay(calendar!
        .years[selectedyear!].weeks[selectedweek!].days[selectedDay].date!);
  }

  String getFormatedDate(int selectedDay) {
    return formatToYear(calendar!
        .years[selectedyear!].weeks[selectedweek!].days[selectedDay].date!);
  }
}
