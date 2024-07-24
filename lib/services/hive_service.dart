import 'package:hive/hive.dart';
import 'package:my_life_calendar_app/models/day_model.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/models/user_model.dart';

class HiveApiService {
  var userProfile = Hive.box('user_profile');
  var userMileStone = Hive.box<Milestone>('user_milestone');
  var userDates = Hive.box<DateTime>('user_dates');
  void create_user_data(int life_expectancy, DateTime birthdate) {
    userProfile.put('user_profile',
        UserProfile(lifeExpectancy: life_expectancy, birthdate: birthdate));
  }

  UserProfile fetchUserData() {
    return UserProfile(
        lifeExpectancy: userProfile.get("user_profile").lifeExpectancy,
        name: userProfile.get('user_profile').name,
        birthdate: userProfile.get('user_profile').birthdate);
  }

  void deleteUserData() {
    userProfile.delete('user_profile');
  }

  void addDates(DateTime pickeddate) {
    userDates.add(pickeddate);
  }

  void deletedates() {
    userDates.deleteFromDisk();
    userMileStone.deleteFromDisk();
  }

  void addMileStone(String description, String title, DateTime pickeddate) {
    final milestone = Milestone(description: description, title: title);

    userMileStone.put(pickeddate.toString(), milestone);
  }

  List<DateTime> fetchDates() {
    return userDates.values.toList()..sort();
  }

  List<Milestone?> fetchMilestone(List<DateTime> dates) {
    return dates.map((date) => userMileStone.get(date.toString())).toList();
  }
}
