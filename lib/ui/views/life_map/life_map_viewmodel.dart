import 'package:my_life_calendar_app/app/app.locator.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';
import 'package:my_life_calendar_app/services/hive_service.dart';
import 'package:stacked/stacked.dart';

class LifeMapViewModel extends BaseViewModel {
  // List of dates
  List<DateTime>? dates;

  // List of milestones corresponding to the dates
  List<Milestone?>? milestoneList;

  // Service instance for Hive API
  final _hiveApi = locator<HiveApiService>();

  // Fetches the dates and corresponding milestones to build the timeline
  Future timeline() async {
    await getDate();
    await getMilestone(dates!);
    rebuildUi();
  }

  Future<void> buildTimeLine() async {
    runBusyFuture(timeline());
  }

  // Fetches the dates from Hive
  Future getDate() async {
    try {
      dates = _hiveApi.fetchDates();
    } catch (e) {
      print(e.toString());
    }
  }

  // Fetches the milestones based on the provided dates
  Future getMilestone(List<DateTime> dates) async {
    try {
      milestoneList = _hiveApi.fetchMilestone(dates);
    } catch (e) {
      print(e.toString());
    }
  }
}
