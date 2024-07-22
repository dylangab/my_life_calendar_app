import 'package:my_life_calendar_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_life_calendar_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_life_calendar_app/ui/views/home/home_view.dart';
import 'package:my_life_calendar_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_life_calendar_app/services/calendar_service_service.dart';
import 'package:my_life_calendar_app/services/hive_api_service.dart';
import 'package:my_life_calendar_app/ui/bottom_sheets/add_milestone/add_milestone_sheet.dart';
import 'package:my_life_calendar_app/ui/views/on_boarding/on_boarding_view.dart';
import 'package:my_life_calendar_app/ui/views/create_profile/create_profile_view.dart';
import 'package:my_life_calendar_app/ui/views/life_calendar/life_calendar_view.dart';
import 'package:my_life_calendar_app/ui/views/life_map/life_map_view.dart';
import 'package:my_life_calendar_app/ui/views/calendar_view/calendar_view_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnBoardingView),
    MaterialRoute(page: CreateProfileView),
    MaterialRoute(page: LifeCalendarView),
    MaterialRoute(page: LifeMapView),
    MaterialRoute(page: CalendarViewView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CalendarServiceService),
    LazySingleton(classType: HiveApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: AddMilestoneSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
