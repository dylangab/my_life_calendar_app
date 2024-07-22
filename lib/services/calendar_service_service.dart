import 'package:my_life_calendar_app/models/day_model.dart';
import 'package:my_life_calendar_app/models/life_calendar_model.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/models/week_model.dart';
import 'package:my_life_calendar_app/models/years_model.dart';

class CalendarServiceService {
  LifeCalendarModel generateCalendar(DateTime startDate, int lifeExpectancy) {
    var end_date = startDate.add(Duration(days: lifeExpectancy * 365));
    List<YearsModel> calendar_data = [];

    for (var yearNum = 1; yearNum <= lifeExpectancy; yearNum++) {
      List<WeeksModel> weeks = [];

      for (var weekNum = 1; weekNum <= 52; weekNum++) {
        List<DayModel> days = [];
        bool weekIsLived = true;

        for (var day = 0; day < 7; day++) {
          if (startDate.isAfter(end_date)) {
            break;
          }

          bool dayIsLived = startDate.isBefore(DateTime.now());

          days.add(DayModel(
            date: startDate,
            isLived: dayIsLived,
            milestone: Milestone(
              description: "",
              title: "",
            ),
          ));

          if (!dayIsLived) {
            weekIsLived = false;
          }

          startDate = startDate.add(const Duration(days: 1));
        }

        weeks.add(WeeksModel(
          weekNumber: weekNum,
          isLived: weekIsLived,
          days: days,
        ));

        if (startDate.isAfter(end_date)) {
          break;
        }
      }

      calendar_data.add(YearsModel(
        yearNumber: yearNum,
        weeks: weeks,
      ));

      if (startDate.isAfter(end_date)) {
        break;
      }
    }
    // LifeCalendarModel lifeCalendar = LifeCalendarModel(years: calendar_data);
    // print(lifeCalendar.years[0].weeks[0].days[0].milestone!.title);
    return LifeCalendarModel(years: calendar_data);
  }

  double getLifeProgress(int lifeExpectancy, DateTime birthdate) {
    var currentdate = DateTime.now();
    int daysLived = currentdate.difference(birthdate).inDays;
    double lifeProgress = (daysLived * 100) / (lifeExpectancy * 365);

    return lifeProgress;
  }

  int getWeeksLeft(int lifeExpectancy, DateTime birthdate) {
    var currentdate = DateTime.now();
    int daysLived = currentdate.difference(birthdate).inDays;
    double livedWeeks = daysLived / 7.toInt();
    livedWeeks = getTotalWeeks(lifeExpectancy).toDouble() - livedWeeks;

    return livedWeeks.toInt();
  }

  int getTotalWeeks(int lifeExpectancy) {
    int totalWeeks = lifeExpectancy * 52;
    return totalWeeks;
  }
}
