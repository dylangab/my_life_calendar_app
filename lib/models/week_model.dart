import 'package:my_life_calendar_app/models/day_model.dart';

class WeeksModel {
  int? weekNumber;
  bool? isLived;
  List<DayModel> days = [];
  WeeksModel(
      {required this.days, required this.weekNumber, required this.isLived});
}
