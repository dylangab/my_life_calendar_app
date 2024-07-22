import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/services/hive_api_service.dart';
import 'package:stacked/stacked.dart';

class LifeMapViewModel extends BaseViewModel {
  List<DateTime>? dates;
  List<Milestone?>? milestoneList;
  final _hiveApi = locator<HiveApiService>();

  Future timeline() async {
    await getDate();
    await getMilestone(dates!);
  }

  Future getDate() async {
    try {
      dates = _hiveApi.fetchDates();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getMilestone(List<DateTime> dates) async {
    try {
      milestoneList = _hiveApi.fetchMilestone(dates);
    } catch (e) {
      print(e.toString());
    }
  }
}
