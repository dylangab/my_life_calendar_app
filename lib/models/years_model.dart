import 'package:my_life_calendar_app/models/week_model.dart';

class YearsModel {
  int? yearNumber;
  List<WeeksModel> weeks = [];
  YearsModel({required this.weeks, required this.yearNumber});
}
