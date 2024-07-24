import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/models/user_model.dart';

void init() {
  initalizeHive();
}

initalizeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserProfileAdapter());
  Hive.registerAdapter(MilestoneAdapter());
  await Hive.openBox('user_profile');
  await Hive.openBox<Milestone>('user_milestone');
  await Hive.openBox<DateTime>('user_dates');
}
