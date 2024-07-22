import 'package:my_life_calendar_app/models/milestone_model.dart';

class DayModel {
  DateTime? date;
  bool? isLived;
  Milestone? milestone;
  DayModel(
      {required this.date, required this.isLived, required this.milestone});
}
